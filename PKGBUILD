# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=VHSgunzo
_pkgname=chisel
pkgname=${_pkgname}-bin
pkgver=1.10.1
pkgrel=1
pkgdesc='A fast TCP/UDP tunnel over HTTP'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
options=('!strip')
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${arch[1]}")
sha256sums=('1edfe3540212ff667e460e212b31178e405139fdff18d643bdd49b05623ac3ac'
            '14d3afb380b65c3df805ee0bf5c666f93490cf7cd3dfd50f6b2e01a7db349ada')
sha256sums_x86_64=('bd1423acc243b15c189a2a95e379104638bc915115a18f11ab3d0b07d09b5cb4')
sha256sums_aarch64=('9bc4784bc739edc3df9f1d23e3fc21f6697bf28a04ae32ec11dfa0ab63ee5e22')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-linux-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
