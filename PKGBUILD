# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin.com>

_pkgname="go-life"
pkgname="${_pkgname}-bin"
pkgver=0.4.0
pkgrel=1
pkgdesc="Terminal based Conway's Game of Life. Implemented in Go."
arch=('x86_64')
url="https://github.com/sachaos/${_pkgname}"
license=('MIT')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_x86_64=("${_pkgsrc}-x86_64::${url}/releases/download/v${pkgver}/${_pkgname}_linux_amd64")
sha256sums=('e76481ce6d1f7e87015786ee38f56cc8e584900f9beeb48783d0132f0f4edfb8'
            '006e6f1c4848f6159f633d47514148ed8cf22ad8cc8f9d95b288fb28832465e0')
sha256sums_x86_64=('5d75b0313d5b0b7e0221d03e6cd57f28c3a64049c0c60d35d0bbe4badd0cc1e4')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
