# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=mm2odt
pkgver=0.9.0beta9
pkgrel=1
pkgdesc="Export a FreeMind mindmap to an OpenOffice.org format .odt and .odp"
arch=('any')
url="http://sourceforge.net/projects/mm2odtfreemind/"
license=('GPL')
depends=('freemind')
source=(http://sourceforge.net/projects/mm2odtfreemind/files/Export%20to%20ODT/for%20FreeMind%200.9.0%20beta%209/Plugin_ODT_FM0.9.0beta9.zip)
md5sums=('17aaccb79771163dffbbfa12e17eb34a')

prepare() {
  cd "${srcdir}"
  find . -type f -exec chmod -x {} \;
}

package() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/share/freemind/plugins
  cp -a "${srcdir}"/* "${pkgdir}"/usr/share/freemind/plugins
  rm "${pkgdir}"/usr/share/freemind/plugins/Plugin_ODT_FM0.9.0beta9.zip
}
