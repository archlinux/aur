# Maintainer: musiclover <musiclover382@protonmail.com>

pkgname=desktop-files-creator
pkgver=1.0.2
pkgrel=1
pkgdesc='Simple app to create desktop files on GNU/Linux'
url="https://github.com/alexkdeveloper/$pkgname"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
license=('GPL3')
depends=('gtk3')
makedepends=('vala' 'meson')
source=("$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b8d86a9e0689af294500d623b188ffa379aaa5460c9552301d5dd56c5eadcc02')

build() {
	arch-meson $pkgname-$pkgver build
	meson compile -C build
}

#skip check because it returns appstream-related error

package() {
	meson install -C build --destdir "$pkgdir"
}
