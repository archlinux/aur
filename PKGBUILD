# Contributor: Connor Behan <connor.behan@gmail.com>

pkgname=python2-cudamat-git
pkgver=77+gaf7d9ca
pkgrel=1
pkgdesc="Python module for performing basic dense linear algebra computations on the GPU using CUDA"
arch=('i686' 'x86_64')
url="https://github.com/cudamat/cudamat"
license=('New BSD')
depends=('python2-numpy' 'cuda' 'python2-nose' 'python2-scipy')
makedepends=('git')
source=("git+https://github.com/cudamat/cudamat.git")


pkgver() {
	cd cudamat
	echo $(git rev-list --count HEAD)+g$(git rev-parse --short HEAD)
}

build() {
	cd $srcdir/cudamat
	python2 setup.py build
}

package() {
	cd ${srcdir}/cudamat
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
md5sums=(SKIP)
