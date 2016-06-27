# Maintainer: Milian Reichardt <mreichardt95@gmail.com>

pkgname=check_mk-agent
pkgver=1.2.8p4
pkgrel=2
pkgdesc="Agent to send information to a Check_MK server"
arch=(any)
url="https://mathias-kettner.de"
license=('GPLv2')
install=${pkgname}.install
depends=('xinetd')
source=("https://mathias-kettner.de/download/check_mk-$pkgver.tar.gz")
md5sums=('SKIP')
build() {
	tar xfvz "$srcdir/check_mk-$pkgver/agents.tar.gz"
}

package() {
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/etc/xinetd.d/"
	cp -r "$srcdir/check_mk_agent.linux" "$pkgdir/usr/bin/check_mk_agent"
	cp -r "$srcdir/cfg_examples/xinetd.conf" "$pkgdir/etc/xinetd.d/check_mk"
}
