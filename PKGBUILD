# Maintainer: Lukas Sabota <LTsmooth42 _at_  gmail _dot _ com>
pkgname=griver
pkgver=0.2.3
pkgrel=1
pkgdesc="Small database generator for iriver H100/H300 devices based on libiriverdb."
arch=('any')
url="http://code.google.com/p/griver/"
license=('GPL')
groups=()
depends=('python2' 'libiriverdb')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=(http://griver.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('ca83abe6d8b022d826249f8606d752cb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=0
  install -m 755 griver.py $pkgdir/usr/bin/ # fix the ./setup.py hashbang overwrite
}

# vim:set ts=2 sw=2 et:
