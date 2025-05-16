# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=vic3-tiger
pkgname=${_basename}-bin
pkgver=1.7.2
pkgrel=1
pkgdesc="Checks game mod files for common mistakes and warns about them."
arch=('x86_64')
url="https://github.com/amtep/ck3-tiger"
license=('GPL3')
depends=()
source=("https://github.com/amtep/ck3-tiger/releases/download/v${pkgver}/${_basename}-linux-v${pkgver}.tar.gz")
sha256sums=('bd32fad25434938da83060debd53381db64dd9dac201125833b917b73101b71d')

package() {
    cd "${srcdir}/${_basename}-linux-v${pkgver}"

    install -Dm755 "${_basename}" "${pkgdir}/usr/bin/${_basename}"
    install -Dm755 "${_basename}-auto" "${pkgdir}/usr/bin/${_basename}-auto"

    install -Dm644 "${_basename}.conf" "${pkgdir}/usr/share/${pkgname}/${_basename}.conf.example"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 CONTRIBUTORS.md "${pkgdir}/usr/share/doc/${pkgname}/CONTRIBUTORS.md"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 TODO.md "${pkgdir}/usr/share/doc/${pkgname}/TODO.md"
    install -Dm644 filter.md "${pkgdir}/usr/share/doc/${pkgname}/filter.md"
}
