# Maintainer: Louis Trezzini <louis.trezzini@ponts.org>
pkgname=imagine++
pkgver=4.3.2
pkgrel=1
pkgdesc="A set of imaging libraries developed at the Imagine group (http://imagine.enpc.fr)."
arch=('i686' 'x86_64')
url="http://imagine.enpc.fr/~monasse/Imagine++/"
license=('BSD')
groups=('')
options=('!strip' '!emptydirs')
source=("http://imagine.enpc.fr/~monasse/Imagine++/downloads/Imagine++-4.3.2-Source.tar.gz")
sha512sums=("eca4151212090e3fd0880fdacf3fc40fb9fdd170c40e3f2033b8208164cb3c4939cb0f7786ca496cb2ca969bc7d9f0e09b1da1007c07b61e17673998722aa358")


build() {
	cd "Imagine++-4.3.2-Source"
	mkdir -p build
	cd build
	cmake -DCMAKE_BUILD_TYPE:string=Release ..
	make
}

package() {
	cd "Imagine++-4.3.2-Source/build"
	make DESTDIR="$pkgdir/" install
}
