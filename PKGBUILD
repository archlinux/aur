# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
_shortname=fzn
pkgver=0.47.4
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
sha256sums_aarch64=('c57e7b0d7ce45a00fea73fefd17e2c5105a7bfe7d4f38b8f0317050649bbcdfc')
sha256sums_x86_64=('41b7c079b4cf3874ad4954c0977b7108328fc2af046c66ec3b1fda5b6009021b')
package() {
  install -Dm755 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/${_shortname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
