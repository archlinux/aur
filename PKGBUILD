# Maintainer: David Barri <japgolly@gmail.com>
pkgname=shift
pkgver=5.0.90
pkgrel=1
pkgdesc="Shift is the desktop app for streamlining your accounts, apps, and workflows."
arch=('x86_64')
url="https://tryshift.com/"
license=('custom')
source=("shift-linux-v$pkgver-stable.zip::https://update.tryshift.com/download/version/$pkgver-stable/linux_32")
sha256sums=('759c13e722d51536321e9ca9f68597a3f7cb153495185601315392759b78ff64')

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
