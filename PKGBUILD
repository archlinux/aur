# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=jubby-bin
pkgver=0.3.4
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
sha256sums=('87152acc05b304488adc9b01e05103582f12b88ecd25eaedc46d23920c0fc5d7')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Instalar licença
    install -Dm644 "${pkgdir}/usr/share/doc/jubby/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
