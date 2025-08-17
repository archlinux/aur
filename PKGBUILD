pkgname=oh-my-theme
pkgver=2.0.0
pkgrel=1
pkgdesc="A terminal-based theme manager for Oh My Posh"
arch=('any')
url="https://github.com/mikeisfree/oh-my-theme"
license=('MIT')
depends=('python' 'python-setuptools')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/4f/e9/93e2229da50c52cc320494709058c9acf1abbba7b337aff1e9cc0155244d/oh_my_theme-2.0.0.tar.gz")
sha256sums=('74a7266d9f708d0c56afd796ace672ea54f542c5ad9f651f7716b997d4dc9bed')

build() {
    cd "oh_my_theme-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "oh_my_theme-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
