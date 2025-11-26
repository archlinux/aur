# Maintainer: sukulent
# shellcheck disable=SC2034 # disable unused variables warning
pkgname='namefix-cpp'
pkgver="1.3.1"
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
sha256sums=(1c711180e6629e665d4cd8fbfc6ea4f97c3f0225c9bfb80021036cc5fb5cea23)
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
