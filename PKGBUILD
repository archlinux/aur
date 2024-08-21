# Maintainer: Martin Diehl <aur@martin-diehl.net>
# Contributor: Ross Whitfield <whitfieldre@ornl.gov>

pkgver=4.4.6
pkgrel=2
pkgname='python-pycifrw'
_name='PyCifRW'
pkgdesc='CIF/STAR file support for Python'
arch=('any')
url='https://github.com/jamesrhester/pycifrw'
license=('Python-2.0')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('9a3d83dfcbbc2a84642eb87df42c9162c1c6f6034b9ff8b3eca34283dfc30991db49164f3e23e824537ffe4114c8bef2c960ca734f0382a3f793e38a950a3872')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
