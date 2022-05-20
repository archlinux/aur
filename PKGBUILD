# Maintainer: Jovan Lanik <jox969@gmail.com>
pkgname=gtklock
pkgver=20220521
pkgrel=1
pkgdesc="GTK-based lockscreen for Wayland"
arch=('x86_64')
url="https://github.com/jovanlanik/gtklock"
license=('GPL3')
depends=(gtk3 gtk-layer-shell wayland pam)
source=("https://github.com/jovanlanik/gtklock/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f7598d4aba28af56f0a4a231c1cea6440dd81d7315f453ccff7e1c87224152fc')

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="$pkgdir/" install
}
