# Maintainer: TingPing <tingping@tingping.se>

pkgname=fpaste
pkgver=0.3.7.3.3
pkgrel=1
pkgdesc='A cli frontend for the fpaste.org pastebin'
arch=('any')
url='http://fpaste.org/'
license=('GPL3')
depends=('python2')
source=("https://fedorahosted.org/released/fpaste/$pkgname-$pkgver.tar.gz")
sha256sums=('47728601aef3430e0e3baf7cdd2f821b6348a99ab5c39d118173028878617f4a')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i 's|#!/usr/bin/env python|#!/usr/bin/env python2|' fpaste
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m755 'fpaste' "$pkgdir/usr/bin/fpaste"
	install -D -m644 'docs/man/en/fpaste.1' "$pkgdir/usr/share/man/man1/fpaste.1"
}
