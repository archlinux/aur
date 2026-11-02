# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
_shortname=fzn
pkgver=0.47.5
pkgrel=1
pkgdesc='Terminal-based, hyper-fast, CRDT-backed, collaborative note-taking tool'
arch=(
  'aarch64'
  'x86_64'
)
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_shortname}-aarch64-unknown-linux-musl.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_shortname}-x86_64-unknown-linux-musl.tar.gz ")
sha256sums_aarch64=('e0446ac592add3adbe3ab01af088e64b98b3a4b9e6382472d82a7d3954edffe0')
sha256sums_x86_64=('a65428337a6c9dc819fb0410c01d2759caa964f399bde19f6dec7ceb29a85683')
package() {
  install -Dm755 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/${_shortname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
