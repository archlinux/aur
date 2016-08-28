# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.21
pkgrel=1
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname/"
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('69c0dbf62f4c818a7f1ce22d2dcf43c488231b7b27261ef3c4a2fe3e3e65e952')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
}
