# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=gnome-shell-extension-outta-space-git
_pkgname=${pkgname%-git}

pkgver=r1.d3673ff
pkgrel=1
pkgdesc="GNOME Shell extension that will give you more space to work with."
arch=('any')
url='https://github.com/cookiengineer/gnome-shell-extension-outta-space'
license=('GPL3')
depends=('gnome-shell' 'xorg-xprop')
makedepends=('git')
source=("git+https://github.com/cookiengineer/gnome-shell-extension-outta-space")
md5sums=('SKIP')
_folder="outta-space@cookie.engineer"

pkgver() {
	cd "$srcdir/$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "$srcdir/$_pkgname"
}

package() {
	cd "$srcdir/$_pkgname"
	mkdir -p "$pkgdir/usr/share/gnome-shell/extensions/$_folder"
	cp -r source/* "$pkgdir/usr/share/gnome-shell/extensions/$_folder"
}
