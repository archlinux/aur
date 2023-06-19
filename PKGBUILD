# Maintainer: Jakub Skowron <jakubskowron676@gmail.com>
pkgname=scolorpicker
pkgver=1.2.1
pkgrel=1
epoch=
pkgdesc="smooll Color Picker for X11"
arch=('x86_64')
url="https://www.github.com/reallySmooll/scolorpicker"
license=('MIT')
groups=()
depends=('libx11' 'glibc' 'xsel' 'libxext')
makedepends=('cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

#prepare() {
#	cd "$pkgname-$pkgver"
#	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
#}

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DINSTALL_SYSTEM_WIDE=YES \
		-Wno-dev
	cmake --build build
}

#check() {
#	cd "$pkgname-$pkgver"
#	make -k check
#}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" $pkgname-$pkgver/LICENSE
}
