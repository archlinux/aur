# Maintainer: Relish0171 <aur.such581@aleeas.com>
_basename=ck3-tiger
pkgname=${_basename}-bin
pkgver=1.14.0
pkgrel=1
pkgdesc="Checks game mod files for common mistakes and warns about them."
arch=('x86_64')
url="https://github.com/amtep/tiger"
license=('GPL3')
depends=()
source=("https://github.com/amtep/tiger/releases/download/v${pkgver}/${_basename}-linux-v${pkgver}.tar.gz")
sha256sums=('b6c3f5e074ca69ae6ea79a76bb03338712eec4059d1d14cc3d895035f9978e70')

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
