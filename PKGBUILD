# Maintainer: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: Erin Sheldon
_pkgname=cmeds
pkgname=cmeds-git
pkgver=v0.9.6.r1.6e2f537
pkgrel=1
pkgdesc="A minimal C library provided for reading MEDS files"  
arch=('x86_64' 'i686')
url="https://github.com/esheldon/meds.git"
license=('GPL3')
depends=('cfitsio')
makedepends=('git')
source=("${_pkgname}::git+${url}")
md5sums=('SKIP')

pkgver() {
	 cd $_pkgname
	 printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
	cd $_pkgname
	make
}


package() {
	  cd $_pkgname
	  make install prefix="$pkgdir"/usr
}
