# Maintainer: AUTplayed <fips.hem@gmail.com>
# Contributor: pavanjadhaw <pavanjadhaw96@gmail.com>
_pkgname=betterlockscreen
pkgname=${_pkgname}-git
pkgver=r42.020b597
pkgrel=1
pkgdesc="A simple lock script for i3lock-color"
arch=('any')
url="https://github.com/pavanjadhaw/betterlockscreen"
license=('MIT')
depends=('i3lock-color-git' 'imagemagick' 'xorg-xrandr' 'xorg-xdpyinfo' 'bc')
makedepends=('git')
optdepends=('feh: Allows setting wallpaper')
conflicts=("betterlockscreen")
source=("${_pkgname}::git+${url}.git")
md5sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp "$srcdir/$_pkgname/$_pkgname" $pkgdir/usr/bin/$_pkgname
}
