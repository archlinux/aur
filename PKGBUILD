# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.5.1
pkgrel=1
pkgdesc="A Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname/"
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e2ffc2ec12134a6a49f99e6ef84b420e9595191173195f8784fe794db5fae452')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 "$pkgname-$pkgver/ui/$pkgname.png" -t "$pkgdir/usr/share/pixmaps/"
	install -Dm644 "$pkgname-$pkgver/ui/$pkgname.desktop" -t "$pkgdir/usr/share/applications/"
}


