pkgname=python2-dfvfs
pkgver=20160117
pkgrel=1
pkgdesc="Digital Forensics Virtual File System (dfVFS)"
url="https://github.com/log2timeline/dfvfs"
license=('Lesser GPL')
arch=('i686' 'x86_64')
depends=('python2')
options=()
md5sum=9a6b61f9f5007f53970b0c9f9deb4c42
source=(https://pypi.python.org/packages/source/d/dfvfs/dfvfs-${pkgver}.tar.gz#md5=$md5sum)
md5sums=($md5sum)



build() {
	export PYTHON=python2
	cd "$srcdir"/dfvfs-${pkgver}

	python2 setup.py build
}

package() {
	cd "$srcdir"/dfvfs-${pkgver}
	python2 setup.py install --root="${pkgdir}"
}
