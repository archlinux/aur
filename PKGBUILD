# Maintainer: Bit-Barron <https://github.com/Bit-Barron>
pkgname=bableredit-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="A modern desktop translation editor for managing multi-language localization files"
arch=('x86_64')
url="https://github.com/Bit-Barron/BablerEdit"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'librsvg' 'openssl')
provides=('bableredit')
conflicts=('bableredit')
source=("${pkgname}-${pkgver}.deb::https://github.com/Bit-Barron/BablerEdit/releases/download/v${pkgver}/BablerEdit_${pkgver}_amd64.deb")
sha256sums=('SKIP')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}/"

    install -Dm644 "${pkgdir}/usr/share/doc/babler-edit/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 2>/dev/null || true
}
