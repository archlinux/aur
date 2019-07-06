# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Rootyjr <rooty (a+) kwtechllc (dot) com>
pkgname=arch-java-gui
pkgver=0.1.3
pkgrel=1
epoch=0
pkgdesc="A Gtk3 frontend for archlinux's archlinux-java script."
arch=('x86_64')
url="https://github.com/Rootyjr/arch-java-gui/releases"
license=('custom:BSD')
depends=('gtk3' 'lxqt-sudo')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Rootyjr/arch-java-gui/archive/v${pkgver}.tar.gz")
md5sums=('a574e7abbb733450d1704dfd45d924e0')


build() {
	cd "$pkgname-$pkgver"
	cargo build --release --bin arch-java-gui --target-dir .
}

package() {
	cd "$pkgname-$pkgver"
	cd release
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	cd ..
	install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
