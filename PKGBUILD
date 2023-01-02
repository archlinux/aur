# Maintainer: tomKPZ <tomKPZ@gmail.com>

_pkgname=menumeters-qt
pkgname=${_pkgname}-git
pkgver=r64.52a657c
pkgrel=1
pkgdesc="display system resources in the system tray"
url="https://github.com/tomKPZ/menumeters-qt"
arch=('any')
license=('GPL3')
depends=('python-pyqt6' 'python-psutil')
source=("git+https://github.com/tomKPZ/menumeters-qt.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -D -m 755 menumeters-qt.py "$pkgdir/usr/bin/menumeters-qt"
}
