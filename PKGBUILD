# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=jubby-bin
pkgver=0.2.0
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
sha256sums=('0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Instalar licença
    install -Dm644 "${pkgdir}/usr/share/doc/jubby/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
