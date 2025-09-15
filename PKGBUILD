# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=keep-presence
pkgver=1.0.7
pkgrel=2
pkgdesc="Moves the mouse on inactivity to emulate activity"
arch=('any')
url="https://github.com/carrot69/keep-presence/"
license=('custom')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
depends=('python' 'python-pynput')
source=("git+https://github.com/carrot69/keep-presence.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}/src"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}/src"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
