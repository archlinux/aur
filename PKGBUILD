# Maintainer: Nikola Hadžić <nikola@firemail.cc>
pkgname="tttt"
pkgver=0.1
pkgrel=1
epoch=
pkgdesc="Tic-Tac-Toe in terminal"
arch=("x86_64")
url="https://gitlab.com/oktopod11/tttt"
license=("GPL3")
groups=()
depends=("marg")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://gitlab.com/oktopod11/$pkgname/raw/master/archive/$pkgname-$pkgver.tar.gz")
noextract=()
sha256sums=("539b224db7935a116e1628fe8bc3dd29efd726bd613364fafffdfd78963394c1")

build() {
	cd "$srcdir/$pkgname"
	make build RELEASE=release
	make link RELEASE=release
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -vp "$pkgdir/usr/bin/"
	mkdir -vp "$pkgdir/usr/share/man/man6/"

	make install INSTALLDIR="$pkgdir/usr/bin/"
	make man MANDIR="$pkgdir/usr/share/man/man6/"
}

