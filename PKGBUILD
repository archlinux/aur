# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

_pkgname=sshs
pkgname=sshs-bin
pkgver="4.4.0"
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
sha256sums_x86_64=("77fd4e00a2f767ed9b238a5994606d02a78b3c5d9a271c4080317d64415fa259")
sha256sums_aarch64=("6341a1ebc142cc9c141255df568bdabc1f3330b2b22c3d02df650028b8a087db")

package() {
    install -Dvm755 "${srcdir}/sshs" "${pkgdir}/usr/bin/sshs"
    install -Dvm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
