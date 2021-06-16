# Maintainer: WithTheBraid <the-one@with-the-braid.cr>
pkgname=yubihibernate
pkgver=0.1.3
pkgrel=1
pkgdesc="Hibernate (or whatever) your computer as soon as your Yubikey is unplugged."
url="https://gitlab.com/TheOneWithTheBraid/yubihibernate/"
arch=(any)
license=('EUPL-1.2')
depends=('yubikey-personalization')
backup=('etc/yubihibernate/device.conf')
source=("https://gitlab.com/TheOneWithTheBraid/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("65b86a6ab1c74076b47a43ac6f9bb0906d5b602a28c07573e975f903658efd62")


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/systemd/system"
	make DESTDIR="$pkgdir" install
}
