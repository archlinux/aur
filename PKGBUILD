# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.1.4
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("647a64e00752583f284c6fc5bd8b4672124c4527cfd53895fb7002a48c2343e90183ae20e5859771aa346aa40954f68a332a35f01775793853e587781b418fb0")

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
