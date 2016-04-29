# Maintainer: graysky <graysky AT archlinux DOT us>
# Contributer: Serge Ziryukin <ftrvxmtrx@gmail.com>
pkgname=spotify-now-git
_pkgname=spotify-now
pkgver=22.9443251
pkgrel=1
pkgdesc="Get information on the current Spotify song"
arch=('any')
url="https://github.com/getmicah/spotify-now"
license=('MIT')
makedepends=('git')
conflicts=('spotify-now')
source=("git://github.com/getmicah/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
