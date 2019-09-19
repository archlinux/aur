# Maintainer: Federico Vivaldi <f.vivaldi1@gmail.com>

pkgname="avogadro-git-eigen3"
pkgver=1.2
pkgrel=1
pkgdesc='Molecule editor and visualizer designed for cross-platform use'
arch=("x86_64")
url="http://avogadro.cc/"
license=('GPL2')
depends=('eigen' 'openbabel' 'qt4')
makedepends=('cmake' 'doxygen' 'git')
source=("${pkgname}"::'git+https://github.com/Avogadro/avogadro.git')
provides=('avogadro')

build() {
        cd "$pkgname"
        
	if [ -e $pkgname/build]
	then
		cd build
	else
		mkdir build
        	cd build
    	fi
        cmake ../
        make -j2
}


package() {
	cd "$pkgname/build"
        make DESTDIR="$pkgdir/" install
}



md5sums=('SKIP')
