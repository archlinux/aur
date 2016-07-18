# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-desktop-gui
pkgver=0.14.0
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
sha256sums=("575b8a0db6b7de7bd86f0b185a47b02ee66c17333eb908479cb1e76a2513608b")
sha256sums_i686=("4eb3c2b1ed599d303f3c01561814ec05e2b4ce8543470ac24e7bda7542aaa6e3")

package() {
    msg "Installing cozy-desktop"
    npm install cozy-desktop

    msg "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}
