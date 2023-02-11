# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

_pkgname='curie'
pkgname="${_pkgname}-font"
pkgver='1.0'
pkgrel=1
pkgdesc="upscaled version of scientifica font"
url="https://github.com/NerdyPepper/${_pkgname}"
license=('OFL')
source=(
    "https://github.com/nerdypepper/${_pkgname}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
)
sha256sums=('07cf4635b3a69b7958fdc456409105bbfe66a2b08cfd6ad141bfe6e9ca2f6edf')
arch=('any')
conflicts=(
    "${_pkgname}-otb"
    "otb-${_pkgname}"
)
provides=(
    "otb-${_pkgname}"
)
package() {
    # Install the OpenType bitmap fonts
    install -D --mode=644 "${srcdir}"/*.otb \
        --target-directory "${pkgdir}/usr/share/fonts/misc"
    # Install the license
    install -D --mode=644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
