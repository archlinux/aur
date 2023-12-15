# Maintainer:TurtleRuss <tttturtleruss@gmail.com> 
pkgname=hustmirror-cli
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=('x86_64')
url=""
license=('GPL')
groups=()
depends=()
makedepends=('make')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
sha256sums=('4dae90345d776c880fc1fb95013503337d9991c32e0222a530ab6ae3f991df5c'
            '89db2182d83d6169514e7d45a4bb0dc5d0d85a2882ecabe89302b33aa1a6b16e')
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	sudo make install
}
