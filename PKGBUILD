# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanshuaikang
_pkgname=nping
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=(!strip !lto)
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('1c199714e88b5705a123cbfd82ea01ebb9278a97187e4cc038e8885489f14a79'
            '552e7da11573eaadf6f629e5da269cbdc2b78b947a83c98e323ab535802d0a4e')
sha256sums_x86_64=('400b98764f0a306ea83f98991a632f6c32008064ee8bd815e304ba54a04841c1')
sha256sums_aarch64=('f6edba0c3032c7b563960243182e4551e6f7d173c105107486a7ddc2d5cec8fa')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}-rs"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
