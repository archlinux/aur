# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: ssprea <ssprea@proton.me>
pkgname=ssprea-nvidia-control
pkgver=1.0.4
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
options=()
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
sha256sums=('a15875cdae333e945c7f92d1f5d3241cfd3e46a4147f982283d4594c856299cb')
