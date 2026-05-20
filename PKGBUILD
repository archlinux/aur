# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=hanshuaikang
_pkgname=nbping
_appname=${_pkgname}
pkgname=${_pkgname}-bin
pkgver=0.7.0
pkgrel=1
pkgdesc='🏎 Nping mean NB Ping, A Ping Tool in Rust with Real-Time Data and Visualizations'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')

depends=('glibc')
provides=("${_appname}")
conflicts=("${_pkgname}" "${_appname}")

options=(!strip !lto)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_appname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_appname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('1c199714e88b5705a123cbfd82ea01ebb9278a97187e4cc038e8885489f14a79'
            '3c89791fde357f519a54f1a7b55834cf67f439036738751b6f00b19c0629089a')
sha256sums_x86_64=('c61ea7a966d0084b2c6a7ffa8af1de8d86e990493775a2aedfd51721d36aabcc')
sha256sums_aarch64=('06dfdd9f2a440213353f79af07a157d0a88f524c6eef571f052c94cc491b6899')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
