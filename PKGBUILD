# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-desktop-gui
pkgver=0.16.0
pkgrel=2
epoch=
pkgdesc="File synchronisation client for Cozy"
arch=('x86_64' 'aarch64')
url="https://cozy.io/"
license=('AGPLv3')
groups=()
depends=('libappindicator-sharp' 'libnotify')
makedepends=('npm')
checkdepends=()
provides=("cozy-desktop-gui")
conflicts=("cozy-desktop-gui")
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://cozy-desktop.cozycloud.cc/debian/pool/cozy-desktop/c/cozy-desktop-gui/cozy-desktop-gui_${pkgver}_amd64.deb")
source_i686=("https://cozy-desktop.cozycloud.cc/debian/pool/cozy-desktop/c/cozy-desktop-gui/cozy-desktop-gui_${pkgver}_i386.deb")
noextract=()
sha256sums=("843144c5129506923c4e22bfb5b042f1dcfa903ef1cacb72bf8eee5cef3f1e83")
sha256sums_i686=("5cc6230814ebd3753345f42f71f8d0c603df83de27831fe01dfede8e1f3fbc88")

package() {
    msg "Installing cozy-desktop"
    npm install cozy-desktop

    msg "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}
