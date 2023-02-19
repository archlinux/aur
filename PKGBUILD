# Maintainer: Felix Schindler <aut at felixschindler dot net>

pkgname=keep-presence
pkgver=1.0.6
pkgrel=1
pkgdesc="Moves the mouse on inactivity to emulate activity"
arch=('any')
url="https://github.com/carrot69/keep-presence/"
license=('custom')
depends=('python' 'python-pynput')
source=(git+https://github.com/carrot69/keep-presence.git#commit=a6cf97405d154d2c0decbdb155aeb3c1bb305648)
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
