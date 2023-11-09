# Maintainer: sukulent
pkgname='namefix'
pkgver="1.0.1"
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
sha256sums=(bbcf0d5046e25e15696b49a62e59d453816e981a8fe3bf194061d87d2f56e945)
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
