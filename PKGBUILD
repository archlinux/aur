# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=1.0.1
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("make" "pandoc" "gzip" "python>=3")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("efab0a6a9d1569d7f5f5da27a9e7c8ce08cb6396248d392e1732d82e03d92881b42f5a81cc858e0f50f869adb1c9d513d2d8c91c1fd381ad944f507fc48e2efc")

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
