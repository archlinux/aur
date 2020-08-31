# Maintainer Fred Junior <fredcox@gmail.com>
# install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
# pkgbase=pkgbase
pkgname=python-desktop-file
pkgver=1.2
pkgrel=1
arch=('any')
pkgdesc="Desktop-file is a tool to create desktop shortcuts for windows and linux."
url="https://github.com/PyRectangle/DesktopFile"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/PyRectangle/DesktopFile/archive/$pkgver.tar.gz")
sha256sums=('4ba309540068755349bae4ee99e7cd9e4ebe0144c95948d77492a090b6b6f333')

build() {
  cd "DesktopFile-${pkgver}"
  python setup.py build
}

package() {
  cd "DesktopFile-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
