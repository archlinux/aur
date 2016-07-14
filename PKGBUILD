# Maintainer: Florian Schweikert <kelvan@ist-total.org>

pkgname=roundup
pkgver=1.5.1
pkgrel=1
pkgdesc="A simple-to-use and -install issue-tracking system with command-line, web and e-mail interfaces. Highly customisable."
arch=('any')
url="http://www.roundup-tracker.org"
license=('PSF')
groups=()
depends=('python2')
#makedepends=('sed')
source=("https://pypi.python.org/packages/bf/14/d61fac5ed2aaca8c720ac4d4077428b8fdafa356089516ba9ee630975d2a/roundup-$pkgver.tar.gz")
sha1sums=('cf302aa375d27cecc7081cf313da00966db41ea4')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix="/usr" --root="$pkgdir" --optimize=1
  #sed -i -e "s|$pkgdir||" "$pkgdir"/usr/bin/*
}
