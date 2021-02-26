pkgname=kuesa
pkgver=1.3.0
pkgrel=1
arch=('x86_64')
pkgdesc="an integrated and unified workflow for designers and developers to create, optimize and integrate real time 3D content in a 3D or hybrid 2D/3D software user interface"
license=('AGPLv3')
depends=('qt5-base' 'qt5-imageformats' 'qt5-quickcontrols' 'qt5-quickcontrols2' 'qt5-3d' 'qt5-declarative')
url="https://www.kdab.com/kuesa/"
source=("https://github.com/KDAB/KUESA/archive/v${pkgver}.tar.gz")
sha256sums=('988821e09c7de082d6edeb227709a83cd0734a712071c8c25ff3e32ea6d936ea')

build() {
  cd kuesa-${pkgver}/
  mkdir -p .git
  qmake
  make
}

package() {
  cd kuesa-${pkgver}/
  make INSTALL_ROOT="$pkgdir" install
  install -D -m644 LICENSE.AGPL.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 LICENSING.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSING.txt"
}
