# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-desktop-gui
pkgver=0.15.0
pkgrel=1
epoch=
pkgdesc="File synchronisation client for Cozy"
arch=('i686' 'x86_64' 'aarch64')
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
sha256sums=("c382582cae4a7421707301ec0386f6eeda2a88a8fb72fd1ab831cd58d45648d7")
sha256sums_i686=("1f6483588a11b76da3cc270d00ef62e1a7132348eafd30202e639efffdbd16bc")

package() {
    msg "Installing cozy-desktop"
    npm install cozy-desktop

    msg "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}
