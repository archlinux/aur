# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.1.3
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("b487413874b8b91695f36cc93e820260acae15f86d8b1afa55563c7b6847f08c6ef5a647060f0768340a70da0f446c0492d3dfe3cd27c998a90d73cc4e67b01d")

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
