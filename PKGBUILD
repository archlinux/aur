# Maintainer:TurtleRuss <tttturtleruss@gmail.com> 
pkgname=hustmirror-cli
pkgver=1.1.2
pkgrel=1
epoch=
pkgdesc="The command line tool (hustmirror-cli) is a small tool that can help you quickly change sources to HUST mirror sources."
arch=('x86_64')
license=('GPL')
url='https://github.com/hust-open-atom-club/hustmirror-cli'
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
source=("$pkgname-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "$pkgname.patch"
		"$pkgname-makefile.patch")
noextract=()
sha256sums=('SKIP'
            'a08dfc1246edcb721505d717dff36abdaa4aee0f1a74c02d4eece69f563cb5e8'
			'b63df2685509bbdd82a97c0b73e4891d013a6a91c19fc029ed79ce9fc35b4710')
validpgpkeys=()

prepare() {
	cd "$pkgname-${pkgver}"
	patch -p1 -i "$srcdir/$pkgname.patch"
	patch -p1 -i "$srcdir/$pkgname-makefile.patch"
	mkdir -p "$pkgdir/usr/local/bin"
}

build() {
	cd "$pkgname-${pkgver}"
	make
}

package() {
	cd "$pkgname-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
