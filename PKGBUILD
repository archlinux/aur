# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=remind-dav-helper-git
pkgver=r4.2d28968
pkgrel=1
pkgdesc="Helper scripts to sync 'remind' files with Nextcloud via CalDAV"
arch=('any')
url="https://www.kabus.eu/git/remind-dav-helper"
license=('GPL')
groups=()
depends=('remind' 'remind-agenda' 'python-remind-caldav' 'bash' 'systemd')
makedepends=('git' 'make')
provides=('remind-dav-helper')
conflicts=('remind-dav-helper')
replaces=()
backup=()
options=()
install=
source=('remind-dav-helper-git::git://www.kabus.eu/git/remind-dav-helper')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
