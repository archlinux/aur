# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.3.1
pkgrel=1
provides=("$pkgname")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("202b9e43ce22b805efdeea790c9f1e620c3f7ed63ac365ed6b5a7811edabdf600155f4ffe8ce7d6541d8aa262877028afc14283b0aa87d61b099a69855ed72fb")

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
