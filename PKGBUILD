pkgname=lime
pkgver=1.0.0
pkgrel=1
pkgdesc="Security wrapper over AUR (paru/yay) with risk analysis"
arch=('any')
url="https://github.com/pachkakirieshek/lime"
license=('MIT')

depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')

source=("git+https://github.com/pachkakirieshek/lime.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/lime"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/lime"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
