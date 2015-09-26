# Maintainer: Lukasz Pozarlik <lpozarlik@gmail.com>

pkgname=pyarchey
pkgdesc="A simple python scrip to display an OS logo in ASCII art along with basic system information."
pkgver=0.6.6
pkgrel=1
arch=('i686','x86_64')
url="https://pypi.python.org/pypi/pyarchey/"
license=('GPL')
arch=('any')
depends=('python' 
	 'python-psutil') 
source=("https://pypi.python.org/packages/source/p/pyarchey/pyarchey-${pkgver}.tar.gz"
	'arch.patch')
md5sums=('218d9b49bcfa68a38b0797a2c773c713'
	 '61a1cf1639c259c06d8d4eb1c1f2e222')

prepare(){
	tar -zxvf pyarchey-${pkgver}.tar.gz
	# some fixes 
	patch -p1 -i "${srcdir}/arch.patch"
}

package(){
	cd pyarchey-${pkgver}
	python setup.py install --root="${pkgdir}" --optimize=1
}

