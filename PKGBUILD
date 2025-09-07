# Maintainer: Love Billenius <lovebillenius@disroot.org>
pkgname=python-avanza-api
pkgver=15.1.2
pkgrel=1
pkgdesc="A Python library for the unofficial Avanza API"
arch=('any')
url="https://github.com/Qluxzz/avanza"
license=('MIT')
depends=('python-requests' 'python-websockets' 'python-pydantic' 'python-pyotp' 'licenses')
makedepends=('python-setuptools' 'python-pip' 'python-build')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qluxzz/avanza/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('52fc00a3cbbbecd2b39122f2750994ca78a2ae06cf00395deb20305ae30eb0fa')

prepare() {
  cd "$srcdir/avanza-$pkgver"
}

build() {
  cd "$srcdir/avanza-$pkgver"
  python -m build
}

package() {
  cd "$srcdir/avanza-$pkgver"
  export PIP_NO_WARN_SCRIPT_LOCATION=0
  python -m pip install . --root="$pkgdir/" --ignore-installed --no-deps
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
