# Maintainer: Charles L <charliehogger31@gmail.com>
pkgname=uefi-run
pkgver=0.3.2
pkgrel=1
pkgdesc="Directly run UEFI applications in qemu"
arch=('x86_64')
url="https://github.com/Richard-W/uefi-run"
license=('MIT')
makedepends=('rust')
optdepends=('qemu: emulation binaries'
	'ovmf: UEFI bios binaries')
install=
changelog=
source=("https://github.com/Richard-W/uefi-run/archive/v${pkgver}.tar.gz")
md5sums=('36e26fbe0a7d0b40262faa6728195441')

build() {
	cd "$pkgname-$pkgver"
	cargo build
}

check() {
	cd "$pkgname-$pkgver"
	cargo check
}

package() {
	cd "$pkgname-$pkgver"
	cargo install --path . --root "${pkgdir}/usr" --bin uefi-run
}
