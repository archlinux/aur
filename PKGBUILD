# Maintainer: Sophie 'Sharky' Schumann <sharky@sharky.pw>
pkgname=nyancoin-daemon
pkgver=1.3.2
pkgrel=1
epoch=
pkgdesc="NyanCoin daemon"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://reddit.com/r/NyanCoins"
license=('MIT')
groups=()
depends=(boost-libs libdb-4.8 openssl miniupnpc)
makedepends=(boost)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/Nyancoins/nyancoin-client.git")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	cd "nyancoin-client"
	
}

build() {
	cd "nyancoin-client/src"
		make -f makefile.unix RELEASE=1
}

package() {
	cd "nyancoin-client/src"
	mkdir "$pkgdir/usr/bin" -p
	cp -v "nyancoind" "$pkgdir/usr/bin/"
}

