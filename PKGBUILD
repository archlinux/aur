# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanshuaikang
_pkgname=nping
pkgname=${_pkgname}-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}" "nmap")
provides=("${_pkgname}")
options=(!strip !lto)
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('1c199714e88b5705a123cbfd82ea01ebb9278a97187e4cc038e8885489f14a79'
            '3f5cea01da0443973272f99453f042c692007dcbf3136a1fc1336d1372cd3b17')
sha256sums_x86_64=('dfafc0fce466234575c2d36f6777048a87fd129134b2dd8fdc462aef589a8888')
sha256sums_aarch64=('9f46a13a8b4447b8aa2455dab77751942a6954935d69e04981fc5b4a00e86747')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
