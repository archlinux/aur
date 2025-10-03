# Maintainer: sukulent
# shellcheck disable=SC2034 # disable unused variables warning
pkgname='namefix-cpp'
pkgver="1.3.0"
pkgrel="1"
# epoch=
pkgdesc="Fix bad filenames"
arch=("x86_64")
url="https://github.com/sukulent/namefix-cpp"
license=('GPL-3-or-later')
# groups=()
depends=('icu' 'gcc-libs' 'glibc')
makedepends=('make' 'binutils' 'gcc')
# checkdepends=()
# optdepends=()
# provides=()
# conflicts=()
replaces=('namefix')
# backup=()
# options=()
# install=
# changelog=
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sukulent/namefix-cpp/tar.gz/refs/tags/v$pkgver")
# noextract=()
sha256sums=(32e948601d7cd24d3d498126789a1db72b2c176a10fca8a6f124f648c1c2c18d)
# validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"
	make namefix
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./namefix "$pkgdir/usr/bin/namefix"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/namefix"
	install -Dm644 ./man/namefix.1 "$pkgdir/usr/share/man/man1/namefix.1"
}
