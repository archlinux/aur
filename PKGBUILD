# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgname=remind-dav-helper-git
pkgver=r16.21caf2d
pkgrel=1
pkgdesc="Helper scripts to sync 'remind' files with Nextcloud via CalDAV"
arch=('any')
url="https://gitlab.com/dkabus/remind-dav-helper"
license=('GPL')
groups=()
depends=('remind' 'remind-agenda' 'python-remind-caldav' 'bash' 'systemd' 'fzf')
makedepends=('git' 'make')
provides=('remind-dav-helper')
conflicts=('remind-dav-helper')
replaces=()
backup=()
options=()
install=
source=('remind-dav-helper-git::git+https://gitlab.com/dkabus/remind-dav-helper')
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
