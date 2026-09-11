# Maintainer: Nacho <sinergia.comunidad.linuxera@gmail.com>
pkgname=sinergia-reflector-top
pkgver=1.0.6
pkgrel=1
pkgdesc="Aplicación gráfica en Python y Tkinter para optimizar los espejos de Arch Linux usando Reflector"
arch=('any')
url="https://github.com/Nacho-Telmo/Sinergia-Reflector-Top"
license=('GPL-3.0-or-later')
depends=('python' 'tk' 'reflector' 'polkit')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Nacho-Telmo/Sinergia-Reflector-Top/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}.png::https://github.com/Nacho-Telmo/Sinergia-Reflector-Top/raw/v${pkgver}/${pkgname}.png"
        "${pkgname}.desktop")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

package() {
    cd "${srcdir}/Sinergia-Reflector-Top-${pkgver}"

    # Instalar el script principal de forma limpia en /usr/bin sin la extensión .py
    install -Dm755 reflector_gui.py "${pkgdir}/usr/bin/sinergia-reflector-top"

    # Recursos gráficos y de escritorio
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

    # Licencia oficial requerida por las directrices del AUR
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
