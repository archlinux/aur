_name=python-dateutil-git
pkgname=python-dateutil-git
_pkgname=${pkgname%-git}
pkgver=2.8.2
pkgrel=1
pkgdesc="Provides powerful extensions to the standard datetime module"
arch=('any')
license=('BSD' 'Apache')
url="https://github.com/dateutil/dateutil"
depends=('python' 'python-six')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools-scm')
source=("$_pkgname::git+$url.git")
sha256sums=('SKIP')

build() {
    cd "$_pkgname"
    echo "$pkgdir"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
