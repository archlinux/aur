# Maintainer: Emmanuel Farhi <emmanuel.farhi.1@gmail.com>
# create Arch package with: makepkg -si
pkgname='looktxt'
pkgver=1.4.1
pkgrel=1
pkgdesc="Search and export numerics from any text/ascii file"
arch=('x86_64')
url="https://gitlab.com/soleil-data-treatment/soleil-software-projects/$pkgname"
license=('MIT')
depends=()
makedepends=('make')
source=("git+https://gitlab.com/soleil-data-treatment/soleil-software-projects/$pkgname")
md5sums=('SKIP')

build() {
	cd "$pkgname"
	make
	echo "[OK] Built $pkgname"
}

package() {
	install -Dm644 "${srcdir}/$pkgname/man/$pkgname.1" "${pkgdir}/usr/share/man/man1/$pkgname.1"
	install -Dm755 "${srcdir}/$pkgname/$pkgname"   "${pkgdir}/usr/bin/$pkgname"
	echo "[OK] Installed $pkgname"
}


