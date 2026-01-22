# Maintainer: piratecarrot <39475419+piratecarrot@users.noreply.github.com>
pkgname=python-numpysane
_name=${pkgname#python-}
pkgver=0.42
pkgrel=1
pkgdesc="More reasonable core functionality for numpy"
arch=('i686' 'x86_64')
url="https://github.com/dkogan/numpysane"
license=('LGPL3')
depends=('python-numpy')
makedepends=('python-setuptools' 'python-build' 'python-installer')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('47f240cab2fd05a26776b91c0e07e03b1ebaf943005bcea0fc1585ded079b0bd')

build() {
	cd $srcdir/$_name-$pkgver
	python -m build --wheel --no-isolation
}

package() {
	cd $srcdir/$_name-$pkgver
        python -m installer --destdir="$pkgdir" dist/*.whl
}
