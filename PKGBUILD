# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=checkupdates-systemd-git
pkgver=r8.c8dd565
pkgrel=1
pkgdesc="Systemd service and timer to check for updates using pacman-contrib"
arch=('any')
url="https://gitlab.com/dkabus/checkupdates-systemd"
license=('GPL')
depends=('pacman-contrib' 'systemd')
makedepends=('git' 'make')
provides=('checkupdates-systemd')
conflicts=('checkupdates-systemd')
source=('checkupdates-systemd-git::git+https://gitlab.com/dkabus/checkupdates-systemd')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
