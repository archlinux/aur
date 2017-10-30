# Maintainer: Severen Redwood <severen@shrike.me>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='ttf-monoid'
pkgver='0.61'
pkgrel=3
pkgdesc='A customisable coding font'
arch=('any')
license=('MIT' 'custom:OFL')
depends=('xorg-font-utils' 'fontconfig')
url='http://larsenwork.com/monoid/'
source=(
  "${pkgname}-${pkgver}.zip::https://cdn.rawgit.com/larsenwork/monoid/f16ff9058bb97eafd78d61d415dedefe2d092562/Monoid.zip"
  "${pkgname}-${pkgver}-readme.md::https://raw.githubusercontent.com/larsenwork/monoid/0abc451aaaa650198c065cd97aea4e7895931227/Readme.md"
)
sha512sums=('05e782aa609ddbe66ec6fac1222bc19ffd6dd255cd4ba004260c47da09c303a3752c58dbb21a0269dd0c2af19d3ebd58aeeba388f8020222eceef27ecb3f89ca'
            'fe8afea5e51eb6139bd3db98aa1ffa39be7e529d76937ea7c129ea0db1a349ad12a9173a802c24a392f106fa7386dde80ba375b06a14fddb4d5b927f847538f2')

package() {
  install -D -m644 \
    'Monoid-Regular.ttf' "${pkgdir}/usr/share/fonts/TTF/Monoid-Regular.ttf"
  install -D -m644 \
    'Monoid-Bold.ttf' "${pkgdir}/usr/share/fonts/TTF/Monoid-Bold.ttf"
  install -D -m644 \
    'Monoid-Italic.ttf' "${pkgdir}/usr/share/fonts/TTF/Monoid-Italic.ttf"
  install -D -m644 \
    'Monoid-Retina.ttf' "${pkgdir}/usr/share/fonts/TTF/Monoid-Retina.ttf"

  # Extract the license from the README.
  sed -n '/Monoid is dual licensed/,/OTHER DEALINGS IN THE FONT SOFTWARE./p' \
    "${pkgname}-${pkgver}-readme.md" > \
    'LICENSE'
  install -D -m644 \
    'LICENSE' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
