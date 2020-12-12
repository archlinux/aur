# Maintainer: Cookie Engineer <@cookiengineer>

pkgname=pacman-backup
pkgver=r2.c24edb4
pkgrel=1
pkgdesc='Backup tool for off-the-grid updates via portable USB sticks or (mesh) LAN networks.'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
makedepends=('git')
depends=('nodejs')
url='https://github.com/cookiengineer/pacman-backup'
license=('GPL')
provides=('pacman-backup')
source=('git+https://github.com/cookiengineer/pacman-backup.git')
sha256sums=('SKIP')

_gitname="pacman-backup"

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${_gitname}"
	install -Dm755 pacman-backup.js "$pkgdir/usr/bin/pacman-backup";
}

