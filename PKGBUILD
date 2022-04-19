# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=detwinner
pkgver=0.4.2
pkgrel=2
pkgdesc='Duplicate file finder for the Linux desktop'
url='https://neatdecisions.com/products/detwinner-linux/'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtkmm3>=3.22' 'graphicsmagick')
makedepends=('meson' 'gtest' 'cppcheck')
checkdepends=('appstream-glib')
source=("https://github.com/neatdecisions/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a14928a9bcaf006fb05639978c0acc53011fbcef4552a699c61485b07b0d69bb')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
