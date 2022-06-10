# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Thomas 'Eternahl' ROLLIN
pkgname=cwonf
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="Synchronize your configurations files with a common context"
arch=(x86_64)
url="https://codeberg.org/Eternahl/cwonf"
license=('MIT')
groups=()
depends=()
makedepends=(rust)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"::$url/archive/$pkgver.tar.gz)
noextract=()
md5sums=("d4d4fd12fb5f54a004bc597845388cc4")
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cd "$pkgname"
#	./confEigure --prefix=/usr
	cargo build --release
}

check() {
	cd "$pkgname"
	cargo test
}

package() {
	cd "$pkgname"
	cargo install --path $pkgdir
}
