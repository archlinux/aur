# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=eispice
pkgname=python2-eispice-git
pkgver=0.11.6.1.8.g44c0d09
pkgrel=1
pkgdesc="Clone of Berkley SPICE 3 Simulation Engine. Git version"
url="http://www.thedigitalmachine.net/eispice.html"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('gcc-fortran' 'git')
depends=('python2-numpy' 'python2-scipy')
conflicts=('eispice' 'python2-eispice')
provides=('python2-eispice')
options=('!buildflags')
source=("git://github.com/Narrat/eispice#branch=master")
md5sums=('SKIP')


pkgver() {
	cd $_pkgname
	git describe | sed 's/^v//;s/-/./g'
}

build() {
    cd $srcdir/${_pkgname}

    make
}

package() {
	cd $srcdir/${_pkgname}

	#python2 setup.py install --root=${pkgdir}
	make DESTDIR="$pkgdir/" install
}
