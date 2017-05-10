# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-icon-theme-git
_pkgname=pop-icon-theme
pkgver="r1002.2b96014fb"
pkgrel=1
pkgdesc="A free and open source SVG icon theme for Linux, based on Paper Icon Set and Papirus."
arch=("any")
url="https://github.com/system76/pop-icon-theme"
license=('GPL2' 'CCPL')
makedepends=("git")
optdepends=(
	"gnome-shell>=3.18.3"
	"gnome-flashback>=3.18.2"
	"budgie-desktop>=10.2.7"
	"xfce4-session>=4.12.2"
	"mate-desktop>=1.14.0"
	"mate-desktop>=1.14.0"
	"lxde-common>=0.99.1"
	"pop-gtk-theme-git: Recommended gtk theme"
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
