# Maintainer: Severen Redwood <severen.redwood@gmail.com>
# Report all package issues to `https://github.com/SShrike/arch-packages`

_fontname="monoid"
pkgname="ttf-${_fontname}"
pkgver='0.61'
pkgrel=1
pkgdesc='A customisable coding font'
arch=('any')
license=('MIT' 'custom:OFL')
depends=('xorg-font-utils' 'fontconfig')
url='http://larsenwork.com/monoid/'
source=(
  'https://cdn.rawgit.com/larsenwork/monoid/f16ff9058bb97eafd78d61d415dedefe2d092562/Monoid.zip'
  'https://raw.githubusercontent.com/larsenwork/monoid/master/Readme.md'
)
md5sums=(
  '5d9163c0096077142e8d7f67d0ecc479'
  'cb0b56ae7970def29f89e0aa2d9258ed'
)
install="${pkgname}.install"

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
    'Readme.md' > \
    'LICENSE'
  install -D -m644 \
    'LICENSE' \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
