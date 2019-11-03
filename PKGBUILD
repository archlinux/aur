# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="sini"
pkgver=0.1.1
pkgrel=1
epoch=
pkgdesc="Simple INI handling library"
arch=("x86_64")
url="https://gitlab.com/oktopod11/sini"
license=("LGPL3")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=("staticlibs")
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("6430cc70a65b9c22f85d69a5676b5e267da8cbc0b877eb199e17643fabb36761") 

build () {
	cd "$srcdir/$pkgname/"
	make build
}

package() {
	cd "$srcdir/$pkgname/"
	make install HEADERDIR="$pkgdir/usr/include/sini/" INSTALLDIR="$pkgdir/usr/lib/"
	make man MANDIR="$pkgdir/usr/share/man/man3/"
}
