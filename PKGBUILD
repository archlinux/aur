# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.2.0
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("c9ecbfa8c124c269e9ae26298abff7083a5317932a34422391a3081af7e36a97a50bdfdac5b2eb7255eb2f394e8ae0a2103845b27fc5dfacc61e295c202d7393")

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
