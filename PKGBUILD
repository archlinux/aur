# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.1.2
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("12aca4b1aed6d5504f6fe7cb519d8e40016ee8136232653744d3e941c3ab7ec84191b969991eb356ec162e8ca833f94acd6b9d42f7746f55f3d2d059dd08b5ea")

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
