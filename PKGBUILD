# Maintainer: Love Billenius <lovebillenius@disroot.org>
pkgname=python-avanza-api
pkgver=11.0.0
pkgrel=1
pkgdesc="A Python library for the unofficial Avanza API"
arch=('any')
url="https://github.com/Qluxzz/avanza"
license=('MIT')
depends=('python-requests' 'python-websockets' 'python-pydantic' 'python-pyotp' 'licenses')
makedepends=('python-setuptools' 'python-pip' 'python-build')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Qluxzz/avanza/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d38cd1680777d253269e02f3159c4f6adef2d75336fe069f80939b7541cf37e3')

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
