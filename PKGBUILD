# Maintainer: realroot <scorpion2185@protonmail.com>

pkgname=fortunes-gtk
pkgver=0.1.0
pkgrel=1
pkgdesc="The Fortune Cookie program's graphical user interface, made with gtk."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/realroot/fortunes-gtk"
license=('GPL3')
makedepends=('libadwaita' 'meson' 'git')
depends=('fortune-mod')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/realroot/fortunes-gtk/archive/$pkgver.tar.gz")

package() {
	cd $pkgname
	meson build/
	ninja -C build/
	cd build
	meson install --destdir $pkgdir
	mv $pkgdir/usr/local/* $pkgdir/usr/
	rm -rf $pkgdir/usr/local
}
sha256sums=('c229dd41f6f81b19056c982ae8c9d02e8db7f114131a930a8d601b5cf07fcd78')
