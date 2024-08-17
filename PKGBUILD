# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

_pkgname=sshs
pkgname=sshs-bin
pkgver="4.5.1"
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
sha256sums_x86_64=("f4a2069b743e0573f9adad72e667697cd15d4f04522effccfea40f8ac18780e2")
sha256sums_aarch64=("500947cbaba72ab91d23283710f807e6e05e8aa0d26345f4f9065ee2ef25e020")

package() {
    install -Dvm755 "${srcdir}/sshs" "${pkgdir}/usr/bin/sshs"
    install -Dvm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
