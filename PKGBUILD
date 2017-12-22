# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=looking-glass
pkgver=a9
pkgrel=1
pkgdesc="An extremely low latency KVMFR (KVM FrameRelay) implementation for guests with VGA PCI Passthrough"
url="https://looking-glass.hostfission.com"
arch=('x86_64')
license=('GPL2')
makedepends=('sdl2_ttf' 'spice-protocol')
depends=('sdl2_ttf' 'glu' 'openssl' 'fontconfig')
source=("https://github.com/gnif/LookingGlass/archive/${pkgver}.tar.gz")
sha512sums=('e1921dd3f5d209ba584270dc78629303840c6c586eaced2813654944264309645d964185bae1f8f76f4da721a0d5dfec41c277f02776dc0f567c88c6e845401b')

build() {
	cd "LookingGlass-${pkgver}/client"
	make
}

package() {
	install -Dm755 "LookingGlass-${pkgver}/client/bin/looking-glass-client" "${pkgdir}/usr/bin/looking-glass-client"
}
