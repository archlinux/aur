# Maintainer: Tomasz Duszynski <tduszyns@gmail.com>

pkgname=grabserial
pkgver=1.9.9
pkgrel=1
pkgdesc="Serial dump and timing program"
arch=('any')
url="https://github.com/tbird20d/grabserial"
license=('GPL v2')
depends=('python-pyserial')
makedepends=('python-setuptools')
source=("https://github.com/tbird20d/grabserial/archive/v$pkgver.tar.gz")
sha256sums=('604d61199827b5ed27306204116779e759dfb34de78098028dc28b0c0f099323')

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 NOTES-unicode.txt $pkgdir/usr/share/licenses/$pkgname/NOTES-unicode.txt
  install -D -m644 README.md $pkgdir/usr/share/doc/$pkgname/README.md
  install -d $pkgdir/usr/share/doc/$pkgname/examples
  mv test.sh $pkgdir/usr/share/doc/$pkgname/examples/test.sh
}
