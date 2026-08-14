# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=sshd-lite
pkgname=${_pkgname}-bin
pkgver=1.51.3
pkgrel=1
pkgdesc='A feature-light sshd(8) for Windows, Mac, and Linux'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
_barch=('amd64' '386' 'arm64')
license=('MIT')

conflicts=("${_pkgname}")
provides=("${_pkgname}")

options=('!strip')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[0]}.gz")
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.gz")

sha256sums=('048b252033c0c357931c3fd0619b978b05a3e51700b55d61cb1cedddaf997f89'
            'f40c746ad8e584bc450b3e9cc7a83731bc85346f049ba409ce74981326376188')
sha256sums_x86_64=('5831effde1397817672b654ed55d231356a54d0b0ef4c8e0b66cd4e261cb3a28')
sha256sums_i686=('a6c43c4c8bbb3aa57c9780d54327a3df653933b862cb2cf99f52431495582909')
sha256sums_aarch64=('f8d01233510855f41c4e5ac9e4c879d52a099174ba178222dc0f6c02439dc0c9')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
