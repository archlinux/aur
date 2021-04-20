# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.1
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("git" "make")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("d66bbe66fa82b29800a1f3c1f03ac8aff0f40f329176c9d062865b8ee5cfc8256310e945465ed224f573cdd1518c6d8f47d9e718d2506bae24b47701c5af6f62")

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
