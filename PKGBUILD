
# Maintainer: ssprea <ssprea@proton.me>
_pkgname=ssprea-nvidia-control
pkgname=${_pkgname}-git
pkgver=1.1.10.r4.g147873b
pkgrel=1
epoch=
pkgdesc="GUI NVidia GPU overclock, power limit and fan manager"
arch=('x86_64')
url="https://github.com/ssprea/ssprea-nvidia-control"
license=('unknown')
groups=()
depends=()
makedepends=(
	'git'
	'dotnet-sdk-9.0'
)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=snvctl.install
changelog=
source=("git+$url.git")
noextract=()
sha256sums=()
validpgpkeys=()

pkgver() {

	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
 	cd "$_pkgname"
	make publish
}


package() {
	cd "$_pkgname"

	make DESTDIR="$pkgdir/" installcli
	make DESTDIR="$pkgdir/" installgui
}



sha256sums=('SKIP')
