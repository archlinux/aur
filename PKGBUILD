# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanshuaikang
_pkgname=nping
pkgname=${_pkgname}-bin
pkgver=0.2.4
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
            '4bf6862baaa501b3c55422e4f48b7dc1b053693d3003198fe2bc6e43f9d7fbf8')
sha256sums_x86_64=('2e7509892fd7f2410d7a307918947e3839c13c1288b556e09adcf099756c5ab8')
sha256sums_aarch64=('460710db66c59c8d12be88d0fa64b7f225d62fe205be00c10398eea324e7ebb5')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
