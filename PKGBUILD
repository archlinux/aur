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
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sukulent/namefix/tar.gz/refs/tags/v$pkgver")
# noextract=()
sha256sums=(172ae75d01dc32e1376767b6b942a51d3154ae182f93e770e9c45d4d0a4712c1)
# validpgpkeys=()


build() {
	cd "$pkgname-$pkgver"
	make namefix
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 ./namefix "$pkgdir/usr/bin/$pkgname"
	install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
	install -Dm644 ./man/namefix.1 "$pkgdir/usr/share/man/man1/$pkgname.1"
}
