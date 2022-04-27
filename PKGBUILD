# Maintainer: prg <prg-archlinux@xannode.com>
pkgname=griver
pkgver=0.2.4
pkgrel=1
pkgdesc="Small database generator for iriver H100/H300 devices based on libiriverdb."
arch=('any')
url="https://github.com/prg318/griver"
license=('GPL')
depends=('python2' 'libiriverdb' 'pygtk')
source=("https://github.com/prg318/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3977633d42c954b42d3550a8ed83f2a9575e0d2261964628263e788bb9146c33')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=0
  install -m 755 griver.py $pkgdir/usr/bin/ # fix the ./setup.py hashbang overwrite
}

# vim:set ts=2 sw=2 et:
