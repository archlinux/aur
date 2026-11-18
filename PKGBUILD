# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
_shortname=fzn
pkgver=0.51.2
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
sha256sums_aarch64=('6d3326d0120d4c69515cee2915b15f7e1343d2afe75ce0301467588abf67a982')
sha256sums_x86_64=('cfd0372364964db62b7baf5e73ce8b7c8ef11828f0385780c5a090a5ebb07c9b')
package() {
  install -Dm755 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/${_shortname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
