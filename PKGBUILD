# Maintainer: Celogeek <arch-aur-f5d67e@celogeek.com>
_name=rethinkdb
pkgname=python-$_name
pkgver=2.4.10.post1
pkgrel=1
pkgdesc="Python driver for rethinkdb"
arch=('any')
url="https://github.com/rethinkdb/rethinkdb-python"
license=('LGPL')
depends=('python')
makedepends=(python-build python-installer python-wheel)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name//-/_}/${_name//-/_}-$pkgver.tar.gz)
sha256sums=('3634e03ee13dd637fd7196b80474bf44c64d3eba1dd069ea92b94926702a60bd')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
