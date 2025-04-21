# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wrkflw"
pkgname="${_pkgname}-bin"
pkgver=0.3.0
pkgrel=1
pkgdesc="Validate and execute GitHub Actions workflows locally"
arch=('x86_64')
url="https://github.com/bahdotsh/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc' 'openssl')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
sha256sums=('5a3a5be824eab6fd629dee7a1db11a82112c65bf1333142b653a6dd9487a90e0'
            'e635a29d3556c9b030c44f42c52aee20aa6d22c0e448003baef320e9dc2e1764')
sha256sums_x86_64=('2ddd443a57066a5037b34a64bec45b4898d8e98170cad0b94e46c5212f856f67')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
