# Maintainer: micahco (https://github.com/micahco)
pkgname=spotify-now-git
_pkgname=spotify-now
pkgver=22.9443251
pkgrel=1
pkgdesc="Spotify now playing (for the proprietary spotify client)"
arch=('any')
url="https://github.com/micahco/spotify-now"
license=('BSD-2-Clause')
makedepends=('git')
conflicts=()
source=("git+https://github.com/micahco/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package () {
	cd "$_pkgname"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}
