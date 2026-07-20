# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=o2-rs-bin
_pkgname=o2
pkgver=0.3.4
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
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/coignard/o2/refs/tags/${pkgver}/LICENSE")
source_x86_64=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/${pkgver}/o2-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-bin.tar.gz::${url}/releases/download/${pkgver}/o2-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')
sha256sums_x86_64=('1566ff99d8dcd00335fb536a877800932c77a1c8ecbd8eb4ea912697c9284568')
sha256sums_aarch64=('3ef84e1935257ec672a3a16cdefe9e3b1588e3feed687798e050e3e6f2078ab9')

package() {
    install -Dm0755 o2 "${pkgdir}/usr/bin/o2"
    install -Dm644 LICENSE-"${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: ts=4 sw=4 et:
