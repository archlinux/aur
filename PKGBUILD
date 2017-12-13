# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
_pkgname=betterlockscreen
pkgname=${_pkgname}-git
pkgver=r30.14ead9b
pkgrel=2
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/betterlockscreen"
license=('unknown')
depends=('i3lock-color-git' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo')
makedepends=('git')
optdepends=('feh: Allows setting wallpaper')
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$_pkgname/lock.sh" $pkgdir/usr/bin/$_pkgname
}
