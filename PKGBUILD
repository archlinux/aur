# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Jeffrey E. Bedard <jefbed@gmail.com>
pkgname=batwarn
pkgver=1.0.4
pkgrel=1
epoch=
pkgdesc="Simple battery warning tool which changes X gamma on low battery"
arch=('x86_64' 'x86')
url="https://github.com/jefbed/batwarn"
license=('MIT')
groups=()
depends=('libxxf86vm')
makedepends=()
checkdepends=()
optdepends=()
options=()
install=
changelog=
source=( "https://github.com/jefbed/batwarn/archive/batwarn-$pkgver.tar.gz" )
noextract=()
md5sums=('2efda8823e2aa670a6b64fffad765f94')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgname-$pkgver"
	mkdir -p $pkgdir/usr/bin
	make DESTDIR="$pkgdir" install
}
