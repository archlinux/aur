# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wrkflw"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
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
sha256sums=('caf0eec5da31aa8df6f411b6b35350b5b11304ba2440ead7e928f1886f2229be'
            'e635a29d3556c9b030c44f42c52aee20aa6d22c0e448003baef320e9dc2e1764')
sha256sums_x86_64=('5143442cf5336720d4086c380b5bbb015db1bd0494b2521dc7bf8793a7a146fc')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
