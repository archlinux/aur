# Maintainer: Andrew Fischer <andrew at apastron dot co>
# Original author: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=2.6.0
pkgrel=1
pkgdesc="A simple-to-use and install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="https://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python')
optdepends=('python-psycopg2: for postgresql backend')
source=("https://files.pythonhosted.org/packages/64/93/17eca3bc4e9bda03c45a9b3bf4fd972d96865efa7b0c09100a55cd58d4e7/roundup-$pkgver.tar.gz")
sha256sums=('12fd8fb806047415f22131f965c6ab4026a28dc63f7054e055c8f891950591d4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
}
