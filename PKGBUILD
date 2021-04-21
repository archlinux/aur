# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.2
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("git" "make")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("0168cd7da065ad48a407f0f50b16794927a05e6710e6ede076573887376e290e23bb395a263f96a63a1028e3b473dc55f47930009031f387b85924014bf076b8")

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
