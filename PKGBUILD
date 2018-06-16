# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-icon-theme-git
_pkgname=pop-icon-theme
pkgver="r2148.b1b46e861"
pkgrel=1
pkgdesc="A free and open source SVG icon theme for Linux, based on Paper Icon Set and Papirus."
arch=("any")
url="https://github.com/system76/pop-icon-theme"
license=('GPL2' 'CCPL')
makedepends=("git")
optdepends=(
	"gnome-shell"
	"gnome-flashback"
	"budgie-desktop"
	"xfce4-session"
	"mate-desktop"
	"mate-desktop"
	"lxde-common"
	"pop-gtk-theme-git: Recommended gtk theme"
	"pop-shell-theme-git: Recommended shell theme"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/system76/pop-icon-theme.git")
sha256sums=("SKIP")

#build() { }

package() {
  	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
	make DESTDIR="${pkgdir}" post-install
}

pkgver() {
  	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
