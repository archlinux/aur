# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: bohoomil <@zoho.com>

pkgname=ttf-alef-ibx
pkgver=1.001
pkgrel=6
depends=('fontconfig')
pkgdesc="An open source multiscript web-font"
url="https://alef.hagilda.com/"
arch=('any')
license=('custom:OFL')
groups=('infinality-bundle-fonts-extra')
source=("https://alef.hagilda.com/Alef.zip"
        40-alef.conf
        90-tt-alef.conf)
sha1sums=('7516804f6b3db78d0251159142a8c7904bbf4e82'
          'c10bfbc407205e651eace7b767e045048cf035c8'
          '1ee56d7efec80581dc7d495bbd7e0b9874605ff2')

package() {

  install -D -m644 OFL-license.txt \
    "${pkgdir}"/usr/share/licenses/"${pkgname}"/COPYING

  install -d -m755 "${pkgdir}"/usr/share/fonts/"${pkgname}"
  install -m644 TTF/*.ttf "${pkgdir}"/usr/share/fonts/"${pkgname}"

  install -D -m644 40-alef.conf \
    "${pkgdir}"/etc/fonts/conf.avail/40-alef.conf
  install -D -m644 90-tt-alef.conf \
    "${pkgdir}"/etc/fonts/conf.avail/90-tt-alef.conf

  install -m755 -d "${pkgdir}"/etc/fonts/conf.d
  cd "${pkgdir}"/etc/fonts/conf.d
  ln -s ../conf.avail/40-alef.conf .
  ln -s ../conf.avail/90-tt-alef.conf .
}

