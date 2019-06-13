# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.6
pkgrel=1
pkgdesc="A Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname"
license=('GPL')
depends=('qt5-base' 'libssh>=0.8.7')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f77bad6ac0c27e30c37554d1fb8e12b8243bf61520c11ca5a84e4fd1218a0f60')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	make -j$(nproc)
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname-$pkgver/ui/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "$pkgname-$pkgver/ui/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}


