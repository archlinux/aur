# Maintainer: TexturedPolak <rafal200725@gmail.com>
# Contributor: Felix Leblanc <felix.leblanc1305@gmail.com>
_name=tinytag
pkgname=python-$_name
pkgver=2.1.1
pkgrel=1
pkgdesc="Read music meta data and length of MP3, OGG, FLAC and Wave files"
arch=('any')
url="https://pypi.python.org/pypi/tinytag/"
license=('MIT')
depends=('python')
makedepends=(python-build python-installer python-wheel python-flit-core)
source=("https://github.com/devsnd/$_name/archive/$pkgver.tar.gz")
md5sums=('067070a4dadad0aa255b50c973f45b25')
validpgpkeys=()

prepare(){
	cd $_name-$pkgver/$_name
	# Deleting not necessary files 
	rm -r {icons,tests}
}

build(){
	cd $_name-$pkgver
	python -m build --wheel --no-isolation
}
package(){
	cd $_name-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
}
