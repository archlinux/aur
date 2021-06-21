# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.1.1
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("3be4c200a8b0bffcee83251ccf27d0a32ba354b52909382c8d094b5f3e820089e6220cf1d9c9c6e724776c127dbb7d400f7df892c8cb63939089d779d16e047b")

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
