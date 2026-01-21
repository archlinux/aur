# Maintainer: Julian Yaman <mail at yaman dot pro>
# Contributor: Julian Yaman <mail at yaman dot pro>

pkgname=cryptofetch
pkgver=1.0.1
pkgrel=2
pkgdesc="A neofetch-style terminal application for displaying cryptocurrency prices and stats"
arch=('x86_64' 'aarch64')
url="https://github.com/julianYaman/cryptofetch"
license=('MIT')
depends=()
makedepends=()
provides=('cryptofetch')
conflicts=('cryptofetch')
source=("${pkgname}-${pkgver}-LICENSE::${url}/raw/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${url}/releases/download/v${pkgver}/cryptofetch-linux-amd64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${url}/releases/download/v${pkgver}/cryptofetch-linux-arm64")
sha256sums=('f2e0e168562c0bac57ebe78219e094d369714eda0aeb0949bc123d981072ea04')
sha256sums_x86_64=('98d2976f158a2736afd67c4ecc265f278e0afc3110e74207a9c653fd48e7cee0') 
sha256sums_aarch64=('52d589158d148a37686a0c8fbf02238109a2be9eeec5938d65cef7c39fc5b4c0')

# To generate checksums after release:
# updpkgsums

package() {
    # Install binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/${pkgname}"
    
    # Install LICENSE
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
