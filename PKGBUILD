# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=jpillora
_pkgname=sshd-lite
pkgname=${_pkgname}-bin
pkgver=1.54.1
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
            'd32cdac36f5f0bbf752cd209ef304419c76a0425323356b7c8c7c428d8e83b09')
sha256sums_x86_64=('6b1a4c89e3c505a26eb111e521c1096506761911806663807db5dd6a38369253')
sha256sums_i686=('c1fe08e48f3ea6119726d5e63c40d8d8c77bd6012f38bd01486922e55f54279c')
sha256sums_aarch64=('ba813b388265ca73fcad482cec76647abfa9075094caec4934ff3aa2ff491766')


package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
