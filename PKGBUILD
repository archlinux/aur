# Maintainer: Nacho <sinergia.comunidad.linuxera@gmail.com>
pkgname=sinergia-reflector-top
pkgver=1.0.2
pkgrel=7
pkgdesc="Aplicación gráfica en Python y Tkinter para optimizar los espejos de Arch Linux usando Reflector"
arch=('any')
url="https://github.com/Nacho-Telmo/Sinergia-Reflector-Top"
license=('GPL3')
depends=('python' 'tk' 'reflector' 'polkit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nacho-Telmo/Sinergia-Reflector-Top/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.png::https://github.com/Nacho-Telmo/Sinergia-Reflector-Top/raw/v${pkgver}/${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}/Sinergia-Reflector-Top-${pkgver}"
    install -Dm755 *.py "${pkgdir}/usr/bin/sinergia-reflector-top"
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
