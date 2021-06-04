# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.0.0
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("e7a044abdc6d6a52bcc9135c045eda063848b62958e6565e62e42a96a7bf1fde80e4e06e37065e79fb43fd108a7fd99264cfdee3e918252279d5796b53c03e61")

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
