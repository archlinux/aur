# Maintainer: foxinwinter <fox@foxie.dev>
pkgname=softie
pkgver=0.1.0
pkgrel=1
pkgdesc="Kawaii self-care desktop companion: water/stretch/affirmation/focus reminders"
arch=('any')
url="https://github.com/pawprnt/softie"
license=('MIT')
depends=('python' 'python-pyside6')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
source=("git+https://github.com/pawprnt/softie.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 "aur/softie.desktop" "$pkgdir/usr/share/applications/softie.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
