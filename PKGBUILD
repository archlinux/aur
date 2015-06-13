# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=jaziku
pkgver=1.0.0
pkgrel=1
pkgdesc="Jaziku is statistical inference software for the teleconnections analysis"
url="http://hg.ideam.gov.co:8000/meteorologia/jaziku/summary"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python2' 'python2-distribute' 'python2-scipy' 'python2-dateutil' 'python2-matplotlib' 'python2-numpy' 'python2-pillow' 'python2-clint' 'imagemagick' 'hpgl' 'ncl' 'dos2unix')
#makedepends=('python2-distribute')
source=("https://docs.google.com/uc?id=0B2KQf7Dbx7DUakRMcEM3WUstMFE&export=download")
md5sums=('2f985d0d3a8fe2650aecbb96e0672114')

build() {
	cd ${srcdir}/$pkgname-$pkgver
	python2 ./setup.py build || return 1
}

package(){
	cd ${srcdir}/$pkgname-$pkgver
	python2 ./setup.py install --root=$pkgdir || return 1
}
