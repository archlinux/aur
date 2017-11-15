# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=qt5-systems
pkgver=5.4.0.20160303
_commit=236b6b544fd2049eb46e8f79d13bb7aa35ba002f
pkgrel=2
pkgdesc="Qt Publish and Subscribe Add-on Module"
arch=('x86_64')
url="https://github.com/qtproject/qtsystems"
license=('GPL3' 'LGPL' 'FDL' 'custom')
depends=('qt5-declarative')
makedepends=('git')
source=("git+https://github.com/qtproject/qtsystems.git#commit=$_commit")
sha256sums=('SKIP')

build() {
  cd qtsystems

  qmake-qt5
  make
}

package() {
  cd qtsystems

  make INSTALL_ROOT="${pkgdir}" install

  install -D -m644 LGPL_EXCEPTION.txt \
    "${pkgdir}"/usr/share/licenses/${pkgname}/LGPL_EXCEPTION.txt
}
