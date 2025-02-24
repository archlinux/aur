# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=jooaf
_pkgname=thoth
_pkgexec=thoth
pkgname=${_pkgname}-bin
pkgver=0.1.77
pkgrel=1
pkgdesc='Terminal scratchpad inspired by the Heynote app'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgexec}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux-musl_arm64.tar.gz")
sha256sums=('c6a6aec122be3781408ad1c89b1dc150b5e0d4fa3d56242760d5c47f1fa6c4e6'
            '39c1e09a898c1a90d1f266f175f7d8a8c18a9bc6e8c62184c02f3d4a7d4626e3')
sha256sums_x86_64=('ec6c98405a601d8b532ebb545039710238b46197d8578d73d700d8fe7f49da9d')
sha256sums_aarch64=('13856dd84eeed4d3c871d3bb8a047a75c9ce4e478aa50d7835006d92c5dc1176')

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgexec}" "${pkgdir}/usr/bin/${_pkgexec}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
