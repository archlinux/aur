# Maintainer: getmicah (https://micahcowell.com)
pkgname=spotify-now-git
_pkgname=spotify-now
pkgver=22.9443251
pkgrel=1
pkgdesc="Get information on the current Spotify song. Git version."
arch=('any')
url="https://github.com/micahco/spotify-now"
license=('BSD-2-Clause')
makedepends=('git')
conflicts=()
source=("git://github.com/micahco/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
