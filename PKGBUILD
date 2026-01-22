pkgname=terminal-fireworks
pkgver=0.1.0
pkgrel=2
pkgdesc="Fireworks for the terminal"
arch=('any')
url="https://github.com/chloem3ow/terminal-fireworks"
license=('MIT')
depends=('python')
makedepends=('git' 'python-pip' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/chloem3ow/terminal-fireworks.git#tag=v${pkgver}")

build() {
  cd "$srcdir/$pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('62600d9b40cc43803d48086a1cad09348f6236fd8a94424734f01d96f3e33d02')
