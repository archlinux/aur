# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.4
pkgrel=2
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "zip" "pandoc" "gzip")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("483d42fa4f7a69a8690560f3c975e8732c73792039708137331cd6c08ee8c73a18beca428001b8e48706f1f6bf9b01d6d7b0fa5b7e17b6cef6c86da87f296b6e")

build()
{
        cd "$srcdir/$pkgname"
        make
}

package()
{
        cd "$srcdir/$pkgname"
	make install PREFIX="$pkgdir"
}
