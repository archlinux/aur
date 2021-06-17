# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.1.0
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/pre-1.1.0.tar.gz")
sha512sums=("c5f2489329ef1b7b83028a3b5bd52c278e739a90706e58c1b33c36c88821339b219690a0453fc55d8e25ed538c2669d86db3a7a2633752b68963f7e630744b40")

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
