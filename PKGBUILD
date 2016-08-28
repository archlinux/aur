# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.2
pkgrel=1
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname/"
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ba29cbde9df05538fc4c81f649e40d3754a3d852ab6c064b78898d0f5cafaa7a')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
}
