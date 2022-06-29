# Maintainer: Anton Leontiev <scileont /at/ gmail.com>
pkgname=bitfield-git
pkgver=r48.20aefff
pkgrel=1
pkgdesc='Simple tool to decode individual fields of a register'
arch=('any')
url="http://jk.ozlabs.org/projects/bitfield/"
license=('GPL')
depends=('python-pyparsing')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git://git.ozlabs.org/home/jk/git/bitfield/')
md5sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd ${pkgname%-git}

	make DESTDIR="$pkgdir/" prefix=/usr sysconfdir=/etc install
}
