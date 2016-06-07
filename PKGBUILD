# Maintainer: Brendan Abolivier <brendan@cozycloud.cc>
pkgname=cozy-desktop-gui
pkgver=0.13.0
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
sha256sums=("6de9bbab049146c97b3367f566a5d6410087a4c327383f6a6a7d482bd7d13278")
sha256sums_i686=("6513a1ac79bf6a6eed49a590388aec2d3e423c34a2ce85fdc9d12d3aa872b6ca")

package() {
    msg "Installing cozy-desktop"
    npm install cozy-desktop

    msg "Extracting the data.tar.xz..."
    bsdtar -xf data.tar.xz -C "$pkgdir/"
}
