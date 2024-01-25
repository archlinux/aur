# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
pkgname=fuzzynote-bin
pkgver=0.25.5
pkgrel=3
pkgdesc='Terminal-based, hyper-fast, CRDT-backed, collaborative note-taking tool'
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url='https://github.com/Sambigeara/fuzzynote'
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_arm64.tar.gz")
source_i686=("${pkgname%-bin}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_Linux_x86_64.tar.gz")
sha256sums_aarch64=('1d89624a9371a26e485ae8cf9b730fae29408c3ce21501e589060128b76aaac3')
sha256sums_i686=('b44dbedfbad731cbe4642dd76f2702b608cfe24db8aff15377d7b21d331a02fa')
sha256sums_x86_64=('1588bad7e1b8a76b90f20dfb5dff505f26569a4083ccd9d47b9554b6a89eedee')
package() {
  install -Dm755 "${srcdir}/fzn" -t "${pkgdir}/usr/bin"
  install -Dm644 "${srcdir}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}