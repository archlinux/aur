# Maintainer: Philipp A. <flying-sheep@web.de>

_name=leidenalg
pkgname=python-$_name
pkgver=0.8.10
pkgrel=1
pkgdesc='The Leiden algorithm for community detection'
arch=(any)
url="https://github.com/vtraag/$_name"
license=(GPL3)
depends=(python python-igraph)
makedepends=(python-setuptools python-setuptools-scm python-build python-installer python-wheel)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('670317fed31e87c38b1da4e0792922110f234a8cf5b4c80edd5f791fee537bc1')

build() {
    cd "$srcdir/$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
