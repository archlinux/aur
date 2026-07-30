# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=o2-rs-bin
_pkgname=o2
pkgver=0.3.5
pkgrel=1
pkgdesc='Rust port of the ORCΛ esoteric programming language and terminal livecoding environment'
arch=(
    'x86_64'
    'aarch64'
)
url='https://github.com/coignard/o2'
license=('GPL-3.0-or-later')
makedepends=('cargo')
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
sha256sums_x86_64=('d97d6005834ef3142beb879074456fb2e95175bbae7cfd0d8bd534965ef5f1a8')
sha256sums_aarch64=('19e919179a8ef8a5685266c687840baef09470131788a2731c5d02a931a6e77c')

package() {
    install -Dm0755 o2 "${pkgdir}/usr/bin/o2"
    install -Dm644 o2-LICENSE-"${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=4 sw=4 et:
