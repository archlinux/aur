# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.3.0
pkgrel=1
provides=("$pkgname")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("acaf8de734902c3478906c711a9f3154f601ae1d8ad5ebfdb04112c3b996a3dbda89ad5365be3539f4199d8e29e7a2c19081cfbbe31e694ec0edc43a002a6f56")

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir"
}
