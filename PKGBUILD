
# Maintainer: ssprea <ssprea@proton.me>
_pkgname=slimit
pkgname=${_pkgname}-gpu
pkgver=2.0.0
pkgrel=1
epoch=
pkgdesc="GUI NVidia and AMD GPU overclock, power limit and fan manager"
arch=('x86_64')
url="https://github.com/ssprea/slimit"
license=('unknown')
groups=()
depends=()
makedepends=(
	'git'
	'make'
	'dotnet-sdk-10.0'
	'dotnet-targeting-pack-10.0'
	'aspnet-targeting-pack-10.0'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=slimit.install
changelog=
source=("$_pkgname-$pkgver::git+$url.git#tag=$pkgver")
noextract=()
sha256sums=()
validpgpkeys=()

build() {
 	cd "$_pkgname-$pkgver"
	make -j1 publish
}


package() {
	cd "$_pkgname-$pkgver"

	make DESTDIR="$pkgdir/" installcli
	make DESTDIR="$pkgdir/" installgui
	make DESTDIR="$pkgdir/" installdaemon
}

sha256sums=('SKIP')
