pkgname=swiftpeek-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Ultralight file previewer written in Rust (precompiled binary)"
arch=('x86_64')
url="https://github.com/acosta-dev/SwiftPeek"
license=('MIT') # Cambia esto si usas otra licencia (ej. 'GPL3')
depends=('webkit2gtk-4.1' 'gtk3' 'cairo' 'pango' 'glib2')
provides=('swiftpeek')
conflicts=('swiftpeek')

# Utilizo variables para que en la versión 0.2.0 solo cambies el pkgver de arriba
source=("https://github.com/acosta-dev/SwiftPeek/releases/download/v${pkgver}-1/swiftpeek-${pkgver}-x86_64.tar.gz")

# ¡IMPORTANTE! Reemplaza esto con el hash real
sha256sums=('bcf0d0a6d4fca7af1ed4072bcbbad076cbdad0a2311633e5ddaad86974c676b8')

package() {
    # makepkg extrae el tar.gz automáticamente. 
    # Solo tomamos el binario y lo instalamos en el sistema.
    install -Dm755 "${srcdir}/swiftpeek" "${pkgdir}/usr/bin/swiftpeek"
}
