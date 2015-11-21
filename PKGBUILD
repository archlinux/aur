# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=pyarchey
pkgdesc="A simple python scrip to display an OS logo in ASCII art along with basic system information."
pkgver=0.6.8
pkgrel=1
arch=('i686','x86_64')
url="https://pypi.python.org/pypi/pyarchey/"
license=('GPL')
arch=('any')
depends=('python' 
	 'python-psutil'
	 'python-setuptools') 
source=("https://pypi.python.org/packages/source/p/pyarchey/pyarchey-${pkgver}.tar.gz"
	'arch.patch')
md5sums=('e25b2fb36e483befd6e6d1fa42b2fced'
	 '675768afc3bec92439577408a5d3aad0')

prepare(){
	tar -zxvf pyarchey-${pkgver}.tar.gz
	# some fixes 
	patch -p1 -i "${srcdir}/arch.patch"
}

package(){
	cd pyarchey-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}

