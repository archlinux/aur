# Maintainer: yangon99 <yangon99_all@outlook.com>

pkgname=python-runcommands
pkgver=1.0a61
pkgrel=1
_appname=runcommands
pkgdesc="Simple command/task runner that uses Python's standard library argparse under the hood"
arch=('any')
url="https://github.com/wylee/runcommands"
license=('MIT')
depends=('python-jinja' 'python-pyaml')
makedepends=('python-setuptools' 'flake8' 'python-tox')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/wylee/runcommands/archive/$pkgver.tar.gz")
sha512sums=('612ad156e66a3d3b9d2e8cd929c692dead8739bd8497d983ae588d039b6556c324273b160e553394fb2c558111b797e41f6ccc7d99edcf135022da4eae344b56')

build() {
  cd "$srcdir/$_appname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$_appname-$pkgver"
  pytest
}

package() {
  cd "$srcdir/$_appname-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
