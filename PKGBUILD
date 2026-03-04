# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: seja-arcticfox <seja.czstudio@gmail.com>
pkgname=vidcom
pkgver=0.80
pkgrel=1
epoch=
pkgdesc="Archive and compress videos easily"
arch=('x86_64')
url="https://github.com/seja-arctic-fox/vidcom"
license=('GPL-3.0-only')
groups=()
depends=('gtkmm-4.0' 'libadwaita' 'jsoncpp' 'ffmpeg')
makedepends=('meson' 'ninja')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://github.com/seja-arctic-fox/vidcom/archive/refs/tags/$pkgver.tar.gz")
noextract=()
sha256sums=('73997fd96d28bea2e5e199aa7b60cf6a8f4320b290a1d7bff075f4f92c4ff6e9')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	meson setup build --prefix=/usr
	meson compile -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
