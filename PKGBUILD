# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
_shortname=fzn
pkgver=0.40.0
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
sha256sums_aarch64=('1cd544a3c657804c364cdf1df7cf63fa4d0b1ffcdb4c50aecab4eb671fa21ba5')
sha256sums_x86_64=('a5947a42422b3b99b441db748829b21fb355515aaf3b87b3bfb0a484d48cd04a')
package() {
  install -Dm755 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/${_shortname}" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/${_shortname}-${CARCH}-unknown-linux-musl/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
