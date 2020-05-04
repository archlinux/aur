# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Mainainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-rollbar
pkgver=0.15.0
pkgrel=1
pkgdesc="Easy and powerful exception tracking with rollbar"
arch=(any)
url="https://rollbar.com/docs/notifier/pyrollbar/"
license=('MIT')
depends=('python-requests' 'python-six')
makedepends=('python-setuptools' 'git')
source=("git+https://github.com/rollbar/pyrollbar#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "$srcdir/pyrollbar"
  python setup.py build
}

package() {
  cd "$srcdir/pyrollbar"
  python setup.py install -O1 --skip-build --root="$pkgdir"

  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

