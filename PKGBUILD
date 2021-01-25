# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=servefile
pkgver=0.5.1
pkgrel=5
pkgdesc="Serve or receive files from shell via a small HTTP server"
arch=('any')
url="https://github.com/sebageek/servefile"
license=('GPL3')
depends=('python')
optdepends=('python-pyopenssl: HTTPS support')
makedepends=('git')
# checkdepends=('python-pytest' 'python-pyopenssl')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("https://github.com/sebageek/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('65bf1eba442ab356cbda54d9ce51471ca6df9ec87d3338a02a5bfb5cb062c157')

# check() {
#     cd "$srcdir/$pkgname-$pkgver"
#     pytest
# }

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}
