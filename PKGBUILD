# Maintainer: willemw <willemw12@gmail.com>

_pkgname=scanpy
pkgname=$_pkgname-git
pkgver=0.1+8.gb275545
pkgrel=1
pkgdesc=''
arch=('any')
url='https://github.com/theislab/scanpy'
license=('GPL3')
depends=(
	'python-matplotlib'
	'python-pandas'
	'python-scipy'
	'python-xlrd'
	'python-h5py'
	'python-scikit-learn')
source=($_pkgname::git://github.com/theislab/scanpy.git)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname/$_pkgname"
	python -c 'import _version; print(_version.get_versions()["version"])'
}

build() {
	cd "$srcdir/$_pkgname"
	python setup.py build_ext
	python setup.py build
}

package() {
	cd "$srcdir/$_pkgname"
	python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
