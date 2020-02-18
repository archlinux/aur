# Maintainer: Arsen Musayelyan <moussaelianarsen@gmail.com>
pkgname=pak-git
pkgver=r3.f0ec020
pkgrel=1
pkgdesc="Changes pacman syntax to be more like APT"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
license=('GPLv3')
depends=('pak-config')
replaces=('pak')
makedepends=('go')
source=('git+https://gitlab.com/moussaelianarsen/pak.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/pak"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd pak
	make
}


package() {
	cd pak
	make DESTDIR="$pkgdir/" installbinonly
}
