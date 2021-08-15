# Maintainer: Your Name <youremail@domain.com>
pkgname=mmode-git
pkgver=1.3
pkgrel=1
epoch=
pkgdesc="MMODE is a Mac-like Desktop Environment with much more customizability, modern keyboard-controlled environment and beautiful desktop."
arch=(x86_64 i686)
url="https://github.com/Mengo-Team/MkOsh.git"
license=('MIT')
groups=()
depends=(awesome-git mcd pulseaudio pulseaudio-alsa acpi acpid mpd network-manager-applet pnmixer fish xfce4-power-manager feh pnmixer xorg-xinput noto-fonts-emoji upower xdg-user-dirs ffmpeg iw iproute2 picom-git rofi light-git inter-font)
makedepends=(sed git curl)
checkdepends=()
optdepends=(firefox gedit steam kitty fish nautilus)
provides=()
conflicts=(awesome picom)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=("SKIP")
validpgpkeys=()

prepare() {
	cd "${_pkgname}"
    printf "2.2.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd MkOsh
    cp -r ./* $HOME/.config/awesome
    mkdir -p ~/.config/rofi
    cp $HOME/.config/awesome/configuration/rofi/appmenu/rofi.rasi  ~/.config/rofi/config.rasi
    sed -i '/@import/c\@import "'$HOME'/.config/awesome/configuration/rofi/appmenu/rofi.rasi"' ~/.config/rofi/config.rasi
}

# check() {
# 	cd "$pkgname-$pkgver"
# 	make -k check
# }

package() {
	echo "Installation DOne"
}
