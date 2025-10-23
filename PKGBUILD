# Maintainer: GrayH <pjbbirdie@gmail.com>
pkgname=tetoservice
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="A tool to manage services on all init-systems"
arch=(any)
url="https://git.teto.party/pkgs/tetoservice"
license=('custom:WTFPL')
groups=()
depends=(sh)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://git.teto.party/pkgs/tetoservice/archive/$pkgver.tar.gz"
	"tetofix.patch")
noextract=()
sha256sums=('49d738a4b6634f6c11f69655d9cc97a1ff1d8337e8ff4252309469bcd733aaf5'
            '17c8ce0b5766d6cc9ae1248c0c30daea30f75d900c8918ae28f15a8d7085f388')
validpgpkeys=()

prepare() {
	cd "$pkgname"
	patch -Np1 < ../tetofix.patch
}

package() {
	cd "$pkgname"
	install -Dm755 "tetoservice" "$pkgdir/usr/bin/tetoservice"
}
