# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.6
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "zip" "pandoc" "gzip")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("c8930dbee84100421aa219d891faa3b37777bcf2889ab0a0e4af75379eac6a2079d6fcc806ca241e72a1f4a3bff7144fbe706aca22d745666683a21ba7d023c5")

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir/usr"
}
