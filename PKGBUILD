# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=sshd-lite
pkgname=${_pkgname}-bin
pkgver=1.55.4
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
            '8552a990d4a74aaed4199e997fb054be2907cb1d606cb27185733a6e753eb152')
sha256sums_x86_64=('fc2e08a1648f9d66759d39697d7197df01085cc268fb5d35d2e400a87740d847')
sha256sums_i686=('3fe12f8b12e8a5a6198ae8c912e26f46399bafbc1e8f1965b13307ac7e783f7b')
sha256sums_aarch64=('328c1a37afaacd37d366a725fce0e06f299c953c8d1e29603e7cd14317689786')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
