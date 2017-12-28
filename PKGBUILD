# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=looking-glass
pkgver=a10
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('sdl2_ttf' 'spice-protocol')
depends=('sdl2_ttf' 'glu' 'openssl' 'fontconfig')
source=("https://github.com/gnif/LookingGlass/archive/${pkgver}.tar.gz")
sha512sums=('d58e12218064b41615a579ef0b4e728e6ebbe336ee4a1b6990f6a20c4a434bc4e7892f7ad8a8788c18d48b217b9d6291c5a7648d84be72cbcb909222e1a879ab')

build() {
	cd "LookingGlass-${pkgver}/client"
	make
}

package() {
	install -Dm755 "LookingGlass-${pkgver}/client/bin/looking-glass-client" "${pkgdir}/usr/bin/looking-glass-client"
}
