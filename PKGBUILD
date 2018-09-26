# Maintainer: Jaden Peterson <jadenpeterson150@gmail.com>

pkgname='pac-util-git'
pkgver=1.r6.g6b6aabc
pkgrel=1
pkgdesc='A pacman maintenance utility'
arch=('any')
url='https://github.com/jadenPete/pac'
provides=('pac-util')
conflicts=('pac-util')
license=('MIT')

depends=('expac'
         'ncurses'
         'pacman-contrib')

optdepends=('trizen: AUR support'
            'yay: AUR support')

makedepends=('git')
source=("git+https://github.com/jadenPete/pac.git")
sha256sums=('SKIP')

pkgver() {
	cd pac

	git describe --tags | tail -c +2 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -D "pac/pac" "${pkgdir}/usr/bin/pac"
}
