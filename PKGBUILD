# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.5
pkgrel=1
pkgdesc="A Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname/"
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('37303cf1c817cbe722ca18c0f2a01adfe9c07a01c55c0838cb459478fb564453')

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


