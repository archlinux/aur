# Maintaoner: Hayate NAKA-MURA <is01.njb at gmail dot com>

pkgname="nako-git"
_pkgname="nako"
pkgver=r11.ff269fb
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm"
arch=('any')
url="https://github.com/njb-fm/nako"
license=('BSD')
provides=('nako')
conflicts=('nako')
depends=('sudo' 'pacman' 'jq' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/${_pkgname}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}
