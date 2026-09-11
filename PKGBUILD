# Maintainer: Nacho <sinergia.comunidad.linuxera@gmail.com>
pkgname=sinergia-reflector-top
pkgver=1.0.2
pkgrel=6
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
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Instalar el script principal como ejecutable en /usr/bin
    install -Dm755 sinergia-reflector-top.py "${pkgdir}/usr/bin/sinergia-reflector-top"

    # Instalar el archivo .desktop en las aplicaciones del sistema
    install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

    # Instalar el icono en los pixmaps del sistema
    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
