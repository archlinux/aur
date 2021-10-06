# Maintainer: David Barri <japgolly@gmail.com>
pkgname=shift
pkgver=7.2.2
pkgrel=1
pkgdesc="Shift is the desktop app for streamlining your accounts, apps, and workflows."
arch=('x86_64')
url="https://tryshift.com/"
license=('custom')
source=("shift-linux-v$pkgver-stable.zip::https://update.tryshift.com/download/version/$pkgver-stable/linux_32")
sha256sums=('471125dad711fd2daf2b272cfe5db3dc72aefde23b64332b9fe7ccfbac085876')

package() {
	set -e
	cd Shift-linux-x64

	mkdir -p "$pkgdir/opt"
	cp -r . "$pkgdir/opt/shift"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

	mkdir -p "$pkgdir/usr/bin"
	cd "$pkgdir/usr/bin"
	ln -s ../../opt/shift/Shift
}
