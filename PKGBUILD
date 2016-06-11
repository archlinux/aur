# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=borgmatic
pkgver=1.0.1
pkgrel=1
pkgdesc="A simple Python wrapper script for the borg (and attic) backup software."
arch=('any')
url="http://torsion.org/borgmatic/"
license=('GPL3')
depends=('borg')
makedepends=('python2-setuptools')
optdepends=('attic')
source=("https://torsion.org/hg/$pkgname/archive/$pkgver.tar.gz")
provides=('borgmatic')
sha256sums=('525711573a3c9028da8dcccc5947c8cdd3123f1478322d95b81d00e841f76b2f')


package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 sample/config "$pkgdir/etc/$pkgname/config.example"
  install -D -m644 sample/excludes "$pkgdir/etc/$pkgname/excludes.example"
  install -D -m644 sample/borgmatic.cron "$pkgdir/etc/$pkgname/borgmatic.cron.example"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
