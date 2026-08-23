# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=sshd-lite
pkgname=${_pkgname}-bin
pkgver=1.52.0
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
source_i686=("${_pkgname}-${arch[1]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[1]}.gz")
source_aarch64=("${_pkgname}-${arch[2]}-${pkgver}.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_${_barch[2]}.gz")

sha256sums=('048b252033c0c357931c3fd0619b978b05a3e51700b55d61cb1cedddaf997f89'
            '3e11414ac188b2f25cc8552919f3e19635da416b71fec05bf425ad8401063a77')
sha256sums_x86_64=('bad96049ed1cc4bd59498eaab87ee65b6e24fa65ef31d3b26468960493cd1054')
sha256sums_i686=('62d187017bed579ae263d1579deaa2307f1206d95ce9813dceb759299deadcf7')
sha256sums_aarch64=('cf82c3a96713abbb929d0ec0c4f439e3f197a41c1fbdb75475e498d14a8d5823')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
