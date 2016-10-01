# Maintainer: Tomasz Duszynski <tduszyns@gmail.com>

pkgname=grabserial
pkgver=1.9.3
pkgrel=1
pkgdesc="Serial dump and timing program"
arch=('any')
url="https://github.com/tbird20d/grabserial"
license=('GPL v2')
depends=('python2-pyserial')
makedepends=('git' 'python2-setuptools')
source=("https://github.com/tbird20d/grabserial/archive/v$pkgver.tar.gz")
md5sums=('SKIP')

package() {
  cd $srcdir/$pkgname-$pkgver
  python2 setup.py install --root=$pkgdir

  install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -D -m644 README $pkgdir/usr/share/doc/$pkgname/README
  install -d $pkgdir/usr/share/doc/$pkgname/examples
  mv test.sh $pkgdir/usr/share/doc/$pkgname/examples/test.sh
}
