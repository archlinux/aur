# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=1.1.0
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-build" "python-installer" "python-uv-build")
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('7be41e5cda768e5ea8fc68e1b19d210be7e1b7c8e0e56e44261fde8375e7a8f2')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
