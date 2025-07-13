# Author: Einhard Leichtfuß <archer@respiranto.de>
pkgname=ctct
pkgver=0.2.2
pkgrel=1
pkgdesc="a simple console contact manager"
arch=('any')
url="https://respiranto.de/bash"
license=('AGPL-3.0-or-later')
backup=('etc/ctct/config.sh')
source=("https://respiranto.de/bash/${pkgname}_v$pkgver.tar.xz")
md5sums=('e3c642310c10c7cea1439c93c1f3ccfd')

build()
{
	cd "${pkgname}_v$pkgver"
	./configure prefix=/usr sysconfdir=/etc
}

package()
{
	cd "${pkgname}_v$pkgver"
	make DESTDIR="$pkgdir" install
}
