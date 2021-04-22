# Maintainer: David Barri <japgolly@gmail.com>
pkgname=shift
pkgver=6.0.62
pkgrel=1
pkgdesc="Shift is the desktop app for streamlining your accounts, apps, and workflows."
arch=('x86_64')
url="https://tryshift.com/"
license=('custom')
source=("shift-linux-v$pkgver-stable.zip::https://update.tryshift.com/download/version/$pkgver-stable/linux_32")
sha256sums=('198d18b5a29b94fe46b5c8893353e5ad0c6ea19e28c3bea77b7b1ee2c5c31b73')

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
