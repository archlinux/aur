# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

_pkgname=sshs
pkgname=sshs-bin
pkgver="4.3.0"
pkgrel="1"
pkgdesc="Terminal user interface for SSH (Binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('openssh')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
changelog=CHANGELOG.md

source=("${url}/raw/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}::${url}/releases/download/${pkgver}/sshs-linux-amd64")
source_aarch64=("${_pkgname}::${url}/releases/download/${pkgver}/sshs-linux-arm64")

sha256sums=('711a86d103b497d5dc01a1864ff8192885fdeb946fd6984dbba5367c058918a1')
sha256sums_x86_64=("0b95bc5bcca89a4fe39799b52377670e28cdb4f7fd11fa15a26612cf4c381569")
sha256sums_aarch64=("ccd6cc4f2e04e4c6a85a0ccc386153ea093d4015eb4486a1e10ad34a2ee5a7ae")

package() {
    install -Dvm755 "${srcdir}/sshs" "${pkgdir}/usr/bin/sshs"
    install -Dvm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
