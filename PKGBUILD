# Contributor: Maxim Devaev <mdevaev@gmail.com>

pkgname=yay-kit
pkgver=20190522
pkgrel=1
pkgdesc="Bash wrapper for pacman and YAY"
url="http://github.com/pi-kvm/yay-kit"
license=(GPL3)
arch=(any)
depends=(yay sudo)
install=$pkgname.install
source=(yay-user pkg-install sudoers)
md5sums=(SKIP SKIP SKIP)


package() {
	cd $srcdir
	install -D -m755 yay-user "$pkgdir/usr/bin/yay-user"
	install -D -m755 pkg-install "$pkgdir/usr/bin/pkg-install"
	install -D -m660 sudoers "$pkgdir/etc/sudoers.d/99-yay"
	chmod 750 "$pkgdir/etc/sudoers.d"
}
