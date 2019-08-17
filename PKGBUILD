# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname=marg
pkgver=0.2
pkgrel=3
epoch=
pkgdesc="Simple argument handling library for C programs"
arch=("x86_64")
url="https://gitlab.com/oktopod11/marg"
license=("LGPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("marg")
conflicts=()
replaces=()
backup=()
options=("staticlibs")
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("49fb4efb2af50de68931a0183fbcb1296848b020b48c45279a76bfdbd46e9955") 

build () {
	cd "$srcdir/$pkgname/"
	make build
}

package() {
	cd "$srcdir/$pkgname/"
	make install HEADERDIR="$pkgdir/usr/include/marg/" INSTALLDIR="$pkgdir/usr/lib/"
	make man MANDIR="$pkgdir/usr/share/man/man3/"
}
