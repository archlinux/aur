
# Maintainer: ssprea <ssprea@proton.me>
pkgname=ssprea-nvidia-control
pkgver=1.1.8
pkgrel=1
epoch=
pkgdesc="GUI NVidia GPU overclock, power limit and fan manager"
arch=('x86_64')
url="https://github.com/ssprea/ssprea-nvidia-control"
license=('unknown')
groups=()
depends=('dotnet-sdk-9.0')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=("$pkgname-$pkgver::git+$url.git#tag=$pkgver")
noextract=()
sha256sums=()
validpgpkeys=()


build() {
 	cd "$pkgname-$pkgver"
	make publish
}


package() {
	cd "$pkgname-$pkgver"

	make DESTDIR="$pkgdir/" installcli
	make DESTDIR="$pkgdir/" installgui
}

sha256sums=('SKIP')
