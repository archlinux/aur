pkgname=markit-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Mark-it CLI tool"
arch=('any')
url="https://github.com/Fr4z49/Mark-it"
license=('GPL3')

depends=('python' 'python-reportlab')

makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')

source=("git+$url.git#branch=beta")

sha256sums=('SKIP')

build() {
    cd "$srcdir/Mark-it"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/Mark-it"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
