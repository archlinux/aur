# Maintainer: sukulent
pkgname='namefix'
pkgver="1.1.0"
pkgrel="1"
# epoch=
pkgdesc="Fix bad filenames"
arch=("x86_64")
url="https://github.com/sukulent/namefix"
license=('GPL-3-or-later')
# groups=()
depends=('icu' 'gcc-libs' 'glibc')
makedepends=('make' 'binutils' 'gcc')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
# replaces=()
# backup=()
# options=()
# install=
# changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sukulent/namefix/tar.gz/refs/tags/v$pkgver")
# noextract=()
sha256sums=(36158febe2125598cc54b48caeaa1016e7fb92c4ef34bbe12b8e41da5d3374c8)
# validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"
	make namefix
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./namefix "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
