# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=checkupdates-systemd-git
pkgver=r2.40c835e
pkgrel=1
pkgdesc="Systemd service and timer to check for updates using pacman-contrib"
arch=('any')
url="https://www.kabus.eu/git/checkupdates-systemd"
license=('GPL')
depends=('pacman-contrib' 'systemd')
makedepends=('git' 'make')
provides=('checkupdates-systemd')
conflicts=('checkupdates-systemd')
source=('checkupdates-systemd-git::git://www.kabus.eu/git/checkupdates-systemd')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
