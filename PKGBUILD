# $Id$
# Maintainer:  Radu Potop <radu at wooptoo dot com>

pkgname=zoho-cliq
pkgver=1.5.0
pkgrel=1
pkgdesc='Zoho Cliq communication software'
arch=('x86_64')
url="https://www.zoho.com/cliq/desktop/linux.html"
license=('Proprietary')
depends=('alsa-lib' 'gtk3' 'libsecret' 'libxss' 'libxtst' 'nss' 'xdg-utils')
optdepends=('libappindicator-gtk3: Systray indicator support'
            'org.freedesktop.secrets: Keyring password store support')
source=(
    "https://downloads.zohocdn.com/chat-desktop/linux/cliq_${pkgver}_amd64.deb"
)
sha256sums=('47ac4e6f7f91a549139aa2740d5020d734539d35c80157e0c8aff0d6ede488a9')

package() {
    install -d "${pkgdir}/opt"
    install -d "${pkgdir}/usr/share"
    cd ${srcdir}/
    tar xf data.tar.xz
    cp -r opt/Cliq "${pkgdir}/opt/Cliq"
    cp -r usr/share/* "${pkgdir}/usr/share/"
}
