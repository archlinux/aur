# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=o2-rs-bin
_pkgname=o2
pkgver=0.3.7
pkgrel=1
pkgdesc='Rust port of the ORCΛ esoteric programming language and terminal livecoding environment'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/coignard/o2'
license=('GPL-3.0-or-later')
options=(
    !strip
    !debug
)
provides=('o2')
conflicts=('o2-rs-git' 'o2-rs')
source=("${_pkgname}-LICENSE-${pkgver}::https://raw.githubusercontent.com/coignard/o2/refs/tags/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/${pkgver}/o2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/${pkgver}/o2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('88877c2e963b5492bd46aa1894fb986cec26d0cd7daced3d81c3692caeae3ad3')
sha256sums_aarch64=('659cee65f2a3b9b13847a28da03cecca000158105d7ed860522916b46afa9841')

package() {
    install -Dm0755 o2 "${pkgdir}/usr/bin/o2"
    install -Dm644 o2-LICENSE-"${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=4 sw=4 et:
