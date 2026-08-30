# Maintainer: Manu Linares <mbarriolinares at gmail dot com>
pkgname=timer-c3-bin
pkgver=0.2
pkgrel=1
pkgdesc="A terminal countdown timer with a progress bar written in C3"
arch=('x86_64' 'aarch64')
url="https://github.com/ManuLinares/timer"
license=('MIT')
provides=('timer' 'timer-c3')
conflicts=('timer' 'timer-bin' 'timer-c3')
options=('!debug' '!strip')

source=("LICENSE-${pkgver}::${url}/raw/main/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/timer-linux-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-${CARCH}.tar.gz::${url}/releases/download/v${pkgver}/timer-linux-aarch64.tar.gz")

sha256sums=('0b05b397cc1e2355391eafde6030860625eb77772493f59d65dd976cedb7d37c')
sha256sums_x86_64=('3d3a944a6e74beb41bea91a484a3074530041104962f74da2e670025165c6744')
sha256sums_aarch64=('2327b65d80aff79f3b9bb0e57881e1e09f023e36a16483bb8da0bb185a2138ad')

package() {
	install -Dm755 "${srcdir}/timer" "${pkgdir}/usr/bin/timer"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}