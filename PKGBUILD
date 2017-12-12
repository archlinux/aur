# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Chris Cromer <chris@cromer.cl>

_url="https://github.com/arch-openrc/opensysusers/archive"

pkgname=opensysusers
pkgver=0.3.2
pkgrel=1
pkgdesc="A standalone utility for handling systemd-style sysusers.d users and groups"
arch=('any')
url="https://github.com/artix-linux/opensysusers"
license=('custom:BSD2')
depends=('shadow' 'openrc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/artix-linux/opensysusers/archive/$pkgver.tar.gz")
sha256sums=('0a3ffb2bf5a3baa9bd49ef522d4bef7fbfa2f51ca6cce24d6354a7ae3c0344d8')

package() {
	cd $pkgname-$pkgver
	make bindir="/usr/bin" DESTDIR="$pkgdir" install
	install -Dm755 openrc/opensysusers.initd "$pkgdir"/etc/openrc/init.d/opensysusers
	install -Dm644 license "$pkgdir"/usr/share/licenses/opensysusers/license
}
