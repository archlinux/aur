# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=gnome-builder-themes-gtksourceview4-git
pkgver=r14447.aab3b443d
pkgrel=1
pkgdesc="Syntax Highlighting themes from Gnome Builder for Gedit and other editors using gtksourceview4"
arch=('any')
url="https://gitlab.gnome.org/GNOME/gnome-builder/"
license=('GPL3')
groups=()
depends=()
makedepends=('git')
provides=()
conflicts=("${pkgname}" gnome-builder)
replaces=()
backup=()
options=()
install=
source=('gnome-builder-themes-gtksourceview4-git::git+https://gitlab.gnome.org/GNOME/gnome-builder.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}/data/style-schemes"
	install -Dm644 -t "$pkgdir/usr/share/gtksourceview-4/styles/" *scheme.xml
}

