# Maintainer: Andrea Pascal <andrea@anodium.net>
pkgname=wla-dx-git
pkgver=v9.5.svn.r361.bfe081d
pkgrel=1
pkgdesc="Yet Another GB-Z80/Z80/6502/65C02/6510/65816/HUC6280/SPC-700 Multi Platform Cross Assembler Package"
arch=('any')
url="https://github.com/vhelin/wla-dx"
license=('GPL2')
groups=()
depends=()
makedepends=('git' 'cmake')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('git://github.com/vhelin/wla-dx.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/wla-dx"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/wla-dx"
	cmake -G "Unix Makefiles" .
	make
}

package() {
	cd "$srcdir/wla-dx"
	make DESTDIR="$pkgdir/" install
}
