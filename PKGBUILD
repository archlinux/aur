# Maintainer: PCITechie <pcitechie@protonmail.com>
pkgname=scratch3-bin
pkgver=3.3.0
pkgrel=1
epoch=
pkgdesc="Scratch 3 as a self-contained desktop application. Binary Release."
arch=(x86_64)
url="https://scratch.mit.edu"
license=('BSD-3-Clause')
groups=()
depends=(alsa-lib atk at-spi2-atk cairo wine dbus desktop-file-utils expat gcc-libs gdk-pixbuf2 glib2 glibc gtk3 hicolor-icon-theme kde-cli-tools kdebase-meta libcups libglvnd libnotify libutil-linux libx11 libxcb libxcomposite libxcursor libxdamage libxext libxfixes libxi libxrandr libxrender libxss libxtst nspr nss pango trash-cli tuxedo-control-center xdg-utils)
makedepends=(tar p7zip)
checkdepends=()
optdepends=(gnome-keyring libgnome-keyring lsb-release pulseaudio)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(https://github.com/redshaderobotics/scratch3.0-linux/releases/download/3.3.0/scratch-desktop_3.3.0_amd64.deb)
noextract=()
md5sums=(2212d6481bff408d15c5cb93600dc2a7) #generate with 'makepkg -g'

prepare() {
    cd "$srcdir"
    7z x scratch-desktop_3.3.0_amd64.deb
    tar -xf data.tar
}

package() {
	cd "$srcdir"
	sudo cp -r usr /
}
