# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanshuaikang
_pkgname=nping
pkgname=${_pkgname}-bin
pkgver=0.3.1
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
            'd483bdc3f72d6d8e1555fe5a116b7f06f65400d2ff6dd35987adfc523b236dce')
sha256sums_x86_64=('32fa31ba5e378341b065348ca8dc8dc6074d8af5a3bc64ec1b8d712b38a7a6fe')
sha256sums_aarch64=('23ef443353c2ef335a81d6ed6c4313e2a643a1c418462d654116bde986143a5d')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
