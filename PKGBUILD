# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Christian Schwarz <me@cschwarz.com>

pkgname=servefile
pkgver=0.5.2
pkgrel=1
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
sha256sums=('5520be6cd5a02aedc6c1c409f1b788e994da5754e40fca3d7dc812207b1060d9')

# check() {
#     cd "$srcdir/$pkgname-$pkgver"
#     pytest
# }

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1
	install -D servefile.1 "$pkgdir/usr/share/man/man1/servefile.1"
}
