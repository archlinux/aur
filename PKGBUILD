# Maintainer : GI_Jack <iamjacksemail@hackermail.com>
# Contributer: Kniyl   <mathias@mettinger.fr>

pkgname=touchegg-gce-git
_pkgname=touchegg-gce
pkgver=1.1
pkgrel=4
pkgdesc="GUI for touchegg"
arch=('i686' 'x86_64')
url="https://github.com/Raffarti/Touchegg-gce"
license=('CC-BY')
depends=('qt4' 'libx11' 'touchegg')
makedepends=('libx11' 'git' )
source=("git://github.com/Raffarti/Touchegg-gce.git")
sha256sums=('SKIP')
 
build() {
  [[ -d "${srcdir}/Touchegg-build" ]] && rm -rf "${srcdir}/Touchegg-build"
  cp -r "${srcdir}/Touchegg-gce" "${srcdir}/Touchegg-build"
  cd "${srcdir}/Touchegg-build"
  qmake-qt4
  make
}
 
package() {
  cd "${srcdir}/Touchegg-build"
  install -Dm755 touchegg-gce "${pkgdir}/usr/bin/touchegg-gce"
  install -d "${pkgdir}/usr/share/touchegg-gce/Dictionaries"
  cp Dictionaries/*.qm Dictionaries/*.ts "${pkgdir}/usr/share/touchegg-gce/Dictionaries"
}
