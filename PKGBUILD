# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=jubby-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="Hub de mini-apps pessoais para Linux"
arch=('x86_64')
url="https://github.com/juicerq/jubby"
license=('MIT')
depends=(
    'cairo'
    'desktop-file-utils'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'pango'
    'webkit2gtk-4.1'
)
provides=('jubby')
conflicts=('jubby')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/jubby_${pkgver}_amd64.deb")
sha256sums=('a3c59a51a2655c1dd7eab4735058f85b100db00afce5c91e152a1211335a15c2')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Instalar licença
    install -Dm644 "${pkgdir}/usr/share/doc/jubby/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
