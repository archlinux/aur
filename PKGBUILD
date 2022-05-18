# Maintainer: Kenneth J. Miller <ken plus aur at miller dot ec>
_pkgname=notify-py
pkgname=python-${_pkgname}
pkgver=0.3.3
pkgrel=1
pkgdesc="Cross platform desktop notifications for Python scripts and applications"
arch=('any')
url="https://github.com/ms7m/notify-py"
license=('MIT')
depends=('python' 'python-jeepney' 'python-loguru')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4971d289eabdb98b0aca9621bfaa3496d7a9920a5f6a6e6a61d7fbbe21118771')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
