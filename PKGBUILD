# Maintainer: Erik Wallström <erik.wallstrom@live.com>
pkgname=pop-gtk-theme-git
_pkgname=pop-gtk-theme
pkgver=2.0.1
pkgrel=1
pkgdesc="An adaptive Gtk+ theme based on the Flat-Plat GTK+ theme."
arch=("any")
url="https://github.com/system76/pop-gtk-theme"
license=('GPL2' 'CCPL')
depends=(
	"gtk3>=3.18.9"
	"gtk2>=2.24.30"
	"gdk-pixbuf2>=2.24.30"
	"gtk-engine-murrine>=0.98.1"
)
makedepends=(
	"inkscape"
	"optipng"
	"libsass>=3.3.6"
	"sassc>=3.3.2"
	"git"
)
optdepends=(
	"gnome-shell>=3.18.3"
	"gnome-flashback>=3.18.2"
	"budgie-desktop>=10.2.7"
	"xfce4-session>=4.12.2"
	"mate-desktop>=1.14.0"
	"lxde-common>=0.99.1"
	"pop-icon-theme-git: Recommended icon theme"
	"ttf-fira-sans: Recommended font for window titles and interface"
	"ttf-fira-mono: Recommended monospace font"
	"ttf-roboto-slab: Recommended font for documents"
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/system76/pop-gtk-theme.git")
sha256sums=("SKIP")

build() {
  	cd "${_pkgname}"
	make
	make assets
}

package() {
  	cd "${_pkgname}"
	make DESTDIR="${pkgdir}" install
}

pkgver() {
  	cd "${_pkgname}"
	echo "$(git describe --tags | cut -d- -f1 | sed 's/^v//')"
}

