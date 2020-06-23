# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Adrian Lopez <zeioth@hotmail.com>
pkgname=rofi-shortcuts-git
pkgver=1.0
pkgrel=1
epoch=
pkgdesc="Customizable cheatsheet based on rofi"
arch=(x86_64 i686)
url="https://github.com/Zeioth/rofi-shortcuts.git"
license=('MIT')
groups=()
depends=()
makedepends=(git rofi)
checkdepends=()
optdepends=()
provides=(rofi-shortcuts)
conflicts=(rofi-shortcuts)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p ~/.config/rofi/rofi-shortcuts/
    mkdir -p ~/.local/share/rofi/rofi-shortcuts/
	  cp "${srcdir}/rofi-shortcuts/rofi-shortcuts.conf" "~/.config/rofi/rofi-shortcuts/rofi-shortcuts.conf"
	  cp "${srcdir}/rofi-shortcuts/rofi-shortcuts.sh" "~/.local/share/rofi/rofi-shortcuts/rofi-shortcuts.sh"
    ln -sf ~/.local/share/rofi/rofi-shortcuts/rofi-shortcuts.sh ~/.local/bin/rofi-shortcuts
}
