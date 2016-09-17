# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.3
pkgrel=1
pkgdesc="A Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/$pkgname/"
license=('GPL')
depends=('qt5-base')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('70374548dcbfb662cea2271411061dde94fda9c5e2214131332a9766047f0474')

build() {
	cd "$pkgname-$pkgver"
	./autogen.sh
	make
}

package() {
	install -Dm755 "$pkgname-$pkgver/$pkgname" -t "$pkgdir/usr/bin/"
}
