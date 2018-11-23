# Maintainer: Joshua Chapman <john.chy99@gmail.com>
pkgname=logic-synthesis-bin
pkgver=1.4
pkgrel=1
epoch=
pkgdesc="Logic synthesis system from UC Berkeley."
arch=('i686' 'x86_64')
url="https://jackhack96.github.io/logic-synthesis"
license=('BSD')
groups=()
depends=('readline')
makedepends=('bison' 'flex')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!strip' '!emptydirs')
install=
changelog=
source=("https://github.com/JackHack96/logic-synthesis/archive/SIS.tar.gz")
noextract=()
md5sums=('7b9a5086603a5aa32fdbbfd5618f64e8')
validpgpkeys=()

build() {
	cd "$srcdir/logic-synthesis-SIS"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/logic-synthesis-SIS"
	make -k check
}

package() {
	cd "$srcdir/logic-synthesis-SIS"
	make DESTDIR="$pkgdir/" install
}
