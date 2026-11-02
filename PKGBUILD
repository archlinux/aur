# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
_shortname=fzn
pkgver=0.48.0
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
sha256sums_aarch64=('f50b6c6742508ea2a77926a2cf6e0e3a9162ecf965416af1835ceb2442d629c0')
sha256sums_x86_64=('28feefcb9d1c4dea6aaeed6f77386a96efe5b16ca3dd61c382267f2a9624acb5')
package() {
  install -Dm755 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/${_shortname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
