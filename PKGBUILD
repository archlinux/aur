# Maintainer: juicerq <julio.cerqueiira@gmail.com>
pkgname=kintsugi-bin
pkgver=0.1.6
pkgrel=1
pkgdesc="Task management for developers with AI-powered workflow"
arch=('x86_64')
url="https://github.com/juicerq/kintsugi"
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
provides=('kintsugi')
conflicts=('kintsugi')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/v${pkgver}/kintsugi_${pkgver}_amd64.deb")
sha256sums=('066e334c96f42536bcb57260e45c5aef3759b6762198d888ac3e9cff48001ca0')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/kintsugi/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
