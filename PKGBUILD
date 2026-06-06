pkgname=terminal-fireworks
pkgver=0.1.1
pkgrel=1
pkgdesc="Fireworks for the terminal"
arch=('any')
url="https://github.com/chloem3ow/terminal-fireworks"
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-wheel' 'python-build' 'python-installer')
source=("git+https://github.com/chloem3ow/terminal-fireworks.git#tag=v${pkgver}")

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}
package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
sha256sums=('d60e04336707c5bb54ac49a3b80f1add771150a4e35109be8d8a140a75b8a428')
