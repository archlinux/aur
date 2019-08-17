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
sha256sums=("f7d4033dc524085f280cecf3fd04a677ba757228686b04ac658c252e4d6d78b0") 

build () {
	cd "$srcdir/$pkgname/"
	make build
}

package() {
	cd "$srcdir/$pkgname/"
	make install HEADERDIR="$pkgdir/usr/include/margpp/" INSTALLDIR="$pkgdir/usr/lib/"
	make man MANDIR="$pkgdir/usr/share/man/man3/"
}
