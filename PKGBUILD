# Maintainer: Soumadip Das <soumadip@zohomail.in>
pkgname=quikrun
pkgver=0.0.6
pkgrel=1
pkgdesc="Run your code without hassle"
arch=("any")
url="https://github.com/soymadip/quikrun"
license=("GPL3")
depends=("python")
makedepends=("python-build" "python-installer" "python-uv-build")
source=("https://files.pythonhosted.org/packages/source/q/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8402bfa1e789bab615d7fbed81325710901fc1fa6ad664c08e6c59e37c170ec1')

build() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver" || exit 1
    python -m installer --destdir="$pkgdir" dist/*.whl
}
