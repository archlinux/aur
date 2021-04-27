# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.5
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "zip" "pandoc" "gzip")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("e824a95174523aa4e73fb257212f3cecaba308e42475b37a2586acf8fcefb631d6ef64bf8d3ff78634d1644d6b9a010fb29ef384a1be072c146d3b02f212be27")

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
