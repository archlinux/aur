# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=0.0.9
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-build" "python-installer" "python-uv-build")
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
