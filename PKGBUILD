# Maintainer: Manu Linares <mbarriolinares at gmail dot com>
pkgname=timer-c3
pkgver=0.2
pkgrel=1
pkgdesc="A terminal countdown timer with a progress bar written in C3"
arch=('x86_64' 'aarch64')
url="https://github.com/ManuLinares/timer"
license=('MIT')
depends=('glibc')
makedepends=('c3c')
options=('!debug')
provides=('timer')
conflicts=('timer' 'timer-bin')

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2bb58867325702425680e8fd06aa12021ba3b3931fb4a8aad84b48f2a7f636f9')

build() {
	cd "timer-${pkgver}"
	c3c build
}

package() {
	cd "timer-${pkgver}"
	install -Dm755 build/timer "${pkgdir}/usr/bin/timer"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
