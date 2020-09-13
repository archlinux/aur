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
sha512sums=('85eaad29bd4edbaa7b3f83f1598683de3bcd41df408f5c44ff151ca06b2fd985248a845a8e5ca737ca4c9f274c54999a74d2be75965d70fbed95059adeca5fd0')


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
