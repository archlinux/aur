# Maintainer: Emiliano Bovetti <emiliano.bovetti at gmail dot com>

pkgname=topiary-bin
pkgver=0.8.0
pkgrel=1
pkgdesc='Topiary is a tool in the Tree-sitter ecosystem, designed for formatter authors and formatter users'
url='https://github.com/tweag/topiary'
arch=(x86_64 aarch64)
license=(MIT)
provides=(topiary)
conflicts=(topiary)
_github_releases="https://github.com/tweag/topiary/releases/download"
source_x86_64=("topiary-cli-x86_64-${pkgver}.tar.xz::${_github_releases}/v${pkgver}/topiary-cli-x86_64-unknown-linux-gnu.tar.xz")
source_aarch64=("topiary-cli-aarch64-${pkgver}.tar.xz::${_github_releases}/v${pkgver}/topiary-cli-aarch64-unknown-linux-gnu.tar.xz")
sha512sums_x86_64=('d9122e49e1ca9337f868775ea1e467b7ef90b4eebee98d445178cb9610777774e39b4c455d6783a2c35547bea87ddbb9c9ac59b7003d7dae3fe7a270d433cf32')
sha512sums_aarch64=('a25b22cf4402d211588ab88d71eb4edf08460a2d3c5a6ac2b9c87db989742c43fdbbdf0d7b586ff45af21721a3f6a4e3e177750a3de382c044505dddb834bb54')

prepare() {
  mv "${srcdir}/topiary-cli-${CARCH}-unknown-linux-gnu" \
    "${srcdir}/topiary-cli-${CARCH}-${pkgver}"
}

package() {
  install -Dm 755 \
    "${srcdir}/topiary-cli-${CARCH}-${pkgver}/topiary" \
    "${pkgdir}/usr/local/bin/topiary"
}
