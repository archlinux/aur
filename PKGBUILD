# Maintainer: 0e4ef622 <0e4ef622 at gmail.com>
pkgname=python-gnuplotlib
_name=${pkgname#python-}
pkgver=0.47
pkgrel=1
pkgdesc="gnuplot for numpy"
arch=('any')
url="https://github.com/dkogan/gnuplotlib"
license=('LGPL-3.0-or-later')
depends=('python-numpy' 'python-numpysane' 'python')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('35ad06a4adf16dba0e4be0f74615e7beb6b8e0358c4cf5c0f98fef85bc46aac8')

build() {
    cd $srcdir/$_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $srcdir/$_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
