# Maintainer : Antoine Carpentier
pkgname=python0.9
pkgver=0.9.1
pkgrel=2
epoch=1
pkgdesc="The oldest version of Python I could find"
arch=('any')
url="https://www.python.org"
license=()
makedepends=('make')
source=('https://www.python.org/ftp/python/src/Python-0.9.1.tar.gz')
sha256sums=('4a9cbf404dc0628eecf06bd3942f8eaf0194797192dbc54c4433ec631ecc688c')
CFLAGS=""
# install=$pkgname.install

prepare()
{
	cd $srcdir/python-0.9.1/src/
	sed -i "s/mv @python python//g" Makefile
}

build()
{
	cd $srcdir/python-0.9.1/src/
	make clean
	make python
}

package()
{
	mkdir -p $pkgdir/usr/bin
	install -m 775 python-0.9.1/src/python $pkgdir/usr/bin/python0.9
}

