# Maintainer: GrayH <pjbbirdie@gmail.com>
pkgname=tetoservice-git
pkgver=0.0
pkgrel=1
epoch=
pkgdesc="A tool to manage services on all init-systems"
arch=(any)
url="https://git.teto.party/pkgs/tetoservice"
license=('custom:WTFPL')
groups=()
depends=(sh)
makedepends=(git)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://git.teto.party/pkgs/tetoservice.git#commit=2b632fe77554558573f6a8117bbb29d8f39c2738"
	"tetofix.patch")
noextract=()
sha256sums=("5fb114c2a91352272d0e5edcfa88dbafeedd1a1fc8b78230d80c4370a6c2bd6a"
	    "17c8ce0b5766d6cc9ae1248c0c30daea30f75d900c8918ae28f15a8d7085f388")
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -Np1 < ../tetofix.patch
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "tetoservice" "$pkgdir/usr/bin/tetoservice"
}
