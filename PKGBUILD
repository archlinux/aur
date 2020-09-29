# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=servefile
pkgver=0.5.1
pkgrel=1
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="http://seba-geek.de/stuff/servefile/"
license=('GPL3')
depends=('python')
makedepends=('git' 'bash')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('802ab4c513ea7f1756852025ad2234c5dd0cb75243a2e277aea9eae8325d5511')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}
