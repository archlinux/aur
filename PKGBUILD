# Maintainer Fred Junior <fredcox@gmail.com>

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
source=("https://github.com/PyRectangle/DesktopFile/archive/$pkgver.tar.gz"
        'https://github.com/PyRectangle/DesktopFile/blob/master/LICENSE.md')
sha256sums=('4ba309540068755349bae4ee99e7cd9e4ebe0144c95948d77492a090b6b6f333'
            '0980560df2c2133c47bd29d39d0f37276f57a54984d21a14b99ca74f986e9c54')

build() {
  cd "DesktopFile-${pkgver}"
  python setup.py build
}

package() {
  install -Dm644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
  cd "DesktopFile-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
