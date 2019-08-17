# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=margpp
pkgver=0.2
pkgrel=3
epoch=
pkgdesc="Simple argument handling library for C++ programs"
arch=("x86_64")
url="https://gitlab.com/oktopod11/marg"
license=("LGPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("margpp")
conflicts=()
replaces=()
backup=()
options=("staticlibs")
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("27dc3aa5b83266239fe1542e5bede2fd40ea5bf98b7394dfdb503c1704ff7ec1") 

build () {
	cd "$srcdir/$pkgname/"
	make build
}

package() {
	cd "$srcdir/$pkgname/"
	make install HEADERDIR="$pkgdir/usr/include/margpp/" INSTALLDIR="$pkgdir/usr/lib/"
	make man MANDIR="$pkgdir/usr/share/man/man3/"
}
