# Maintainer: Jin Asanami <hayatehay.njb at gmail dot com>

pkgname="nako-git"
_pkgname="nako"
pkgver=v1.0.1.r50.f2093df
pkgrel=1
pkgdesc="An AUR helper written in Bash and Pyalpm (development version)"
arch=('any')
url="https://github.com/nmimusic/nako"
license=('BSD')
provides=('nako')
conflicts=('nako')
depends=('sudo' 'pacman' 'git' 'jq' 'python3' 'curl' 'pyalpm' 'python-srcinfo')
optdepends=('aurvote: for voting')
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
	cd ${_pkgname}
	printf "v%s.r%s.%s" "$(git describe --tags|grep -oP '.+(?=-[0-9])')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${srcdir}/${_pkgname}
	make DESTDIR=${pkgdir} PREFIX=/usr install
}
