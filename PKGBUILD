# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: WithTheBraid <the-one@with-the-braid.cr>
pkgname=yubihibernate
pkgver=0.1.1
pkgrel=1
pkgdesc="Hibernate (or whatever) your computer as soon as your Yubikey is unplugged."
url="https://gitlab.com/TheOneWithTheBraid/yubihibernate/"
arch=(any)
license=('EUPL-1.2')
depends=('usbutils')
source=("https://gitlab.com/TheOneWithTheBraid/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("0624c1d567684f7d1f2cf3f5c23cc38bf36f160e55a016c645f00a7af70e0e63")


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/systemd/system"
	make DESTDIR="$pkgdir" install
}
