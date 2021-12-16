# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.3.2
pkgrel=2
provides=("$pkgname")
pkgdesc="An anti-capitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3" "python-setuptools")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama" "python-defusedxml")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/${pkgver}.tar.gz")
sha512sums=("f93f159a6089ce467a46c4cd1d9dc43d2ecfbf5129aecfb0bd2d5c086024ba1665700a2aab6acc8e4bd79c69994423ceb0cd46a51eefe57d55bd16e625ae8a3c")

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
