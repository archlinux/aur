# Maintainer: Andrew Fischer <andrew at apastron dot co>
# Original author: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=2.5.0
pkgrel=1
pkgdesc="A simple-to-use and install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="https://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python')
optdepends=('python-psycopg2: for postgresql backend')
source=("https://files.pythonhosted.org/packages/17/ad/9117015e1116aa3e3c10ff077e8dbe9e2b2cb7ffb0279b29301d3b7a2073/roundup-$pkgver.tar.gz")
sha256sums=('24d64b8e3cdc09bf4386a92ed06a22e78d5491865982592ce6a8529b90816c02')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
