# Maintainer: charlie <github.com/381181295>
# Co-maintainer: SIGTERM <https://github.com/SIGTERM-015>
pkgname=chatwise
pkgver=26.5.0
pkgrel=1
pkgdesc="The fastest AI chatbot"
arch=(x86_64)
url="https://chatwise.app/"
license=('LicenseRef-proprietary')
depends=(gtk3 libnotify nss libxss libxtst xdg-utils at-spi2-core util-linux-libs libsecret hicolor-icon-theme libappindicator-gtk3)
options=(!strip !debug)
source=("https://releases.chatwise.app/${pkgver}/ChatWise-${pkgver}.deb")
sha256sums=('aa39c7d5673116d9fbec45fa621b560e42dfe47347f6be98b500841528f43238')

package() {
    bsdtar -xf data.tar.* -C "${pkgdir}"
    install -d "${pkgdir}/usr/bin"
    ln -s /opt/ChatWise/ChatWise "${pkgdir}/usr/bin/chatwise"
}
