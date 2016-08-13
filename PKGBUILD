# Maintainer: Patrick Eigensatz <patrick.eigensatz@gmail.com>

pkgname=qjournalctl
pkgver=0.2
pkgrel=1
pkgdesc="Qt-based graphical user interface for systemd's journalctl command"
arch=('i686' 'x86_64')
url="https://github.com/pentix/qjournalctl/"
license=('GPL')
depends=('qt5-base')
makedepends=('gcc-libs-multilib')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('debd87fb60d50c4bd01bec99cff80a40')
sha256sums=('ba29cbde9df05538fc4c81f649e40d3754a3d852ab6c064b78898d0f5cafaa7a')

build() {
	cd "$pkgname-$pkgver"
	sh autogen.sh
	make
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	install -m755 "$pkgname-$pkgver/$pkgname" "$pkgdir/usr/bin/"
}
