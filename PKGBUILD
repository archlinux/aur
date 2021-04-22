# Maintainer: Twann <twann@ctemplar.com>

pkgname=tblock
pkgver=0.0.3
pkgrel=1
provides=("$pkgname")
pkgdesc="An anticapitalist ad-blocker that uses the hosts file"
url="https://tblock.codeberg.page"
arch=("any")
license=("GPL3")
makedepends=("git" "make")
depends=("python>=3" "python-urllib3" "python-requests" "python-colorama")
source=("${pkgname}-${pkgver}.tar.gz::https://codeberg.org/tblock/tblock/archive/$pkgver.tar.gz")
sha512sums=("b7896dff641bba61039ac946ef68f3c6e9f09251ba9ff456d8e4509124805f9ef6ec442c1a7d4cd1cf8dbfd74cf54467cf3fe1d0037c471bc5c8c222ac4de243")

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
