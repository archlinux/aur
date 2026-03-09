# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=chisel
pkgname=${_pkgname}-bin
pkgver=1.11.5
pkgrel=1
pkgdesc='A fast TCP/UDP tunnel over HTTP'
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

sha256sums=('445b61eeea1445c155ad63e1c47b1abfa80a922f2f133577f19c12bf9582c0ff'
            '5a1f193ef28b529eee01cf734ef5701ee174d219f94e41d3d110bf5286a532a8')
sha256sums_x86_64=('2506226c4710a3c8d3b332f83d0f3b412fe2a8436b710ea0dbec44b288ab309b')
sha256sums_i686=('86553b96b8cfa74ad58143fb183578d10020a009fc0bf95c55c6203b8cb05df8')
sha256sums_aarch64=('1a4f16aad733f022b9aa90903268d730bfb20b03f9484f7ab4863e442737fa9a')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
