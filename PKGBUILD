# Maintainer: Andrew Fischer <andrew at apastron dot co>
# Original author: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=2.4.0
pkgrel=1
pkgdesc="A simple-to-use and install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="https://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python')
optdepends=('python-psycopg2: for postgresql backend')
source=("https://files.pythonhosted.org/packages/29/b5/20e0f106edc670a46a019e1f1f0af3c46c7ba9ca45fa0a4752af78483ef7/roundup-$pkgver.tar.gz")
sha256sums=('0f4e0f3287e877a38a531c7668308472b85cdc9665b25ba2b90daaf16848b778')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
