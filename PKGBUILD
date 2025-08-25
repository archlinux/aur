# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="wrkflw"
pkgname="${_pkgname}-bin"
pkgver=0.7.1
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
sha256sums=('1d2b423f42a7a805af454c3ca8f81e7997767281dc7c5a58189de8259b4b9257'
            'e635a29d3556c9b030c44f42c52aee20aa6d22c0e448003baef320e9dc2e1764')
sha256sums_x86_64=('63d74683d87648c1a082d644c0072717a83f4917e28d9e310cd3e34cb2dd972f')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
