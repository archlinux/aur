# Maintainer: Kenneth J. Miller <ken plus aur at miller dot ec>
pkgname=python-notify-py
pkgver=0.3.2
pkgrel=1
pkgdesc="Cross platform desktop notifications for Python scripts and applications"
arch=('any')
url="https://github.com/ms7m/notify-py"
license=('MIT')
depends=('python' 'python-jeepney' 'python-loguru')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/notify_py-${pkgver}.tar.gz")
sha256sums=('016b54d20dff55713dce5428d6f6314d3a7e3e6d7d00a57c45ce813534e34a4e')

build() {
  cd "$srcdir/notify_py-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/notify_py-$pkgver"
  python setup.py install -O1 --root="${pkgdir}" --skip-build
# TODO https://github.com/ms7m/notify-py/issues/43
#  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
