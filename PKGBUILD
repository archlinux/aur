# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=atticmatic
pkgver=0.1.7
pkgrel=1
pkgdesc="A simple Python wrapper script for the attic (and borg) backup software."
arch=('any')
url="http://torsion.org/atticmatic/"
license=('GPL3')
depends=('attic')
makedepends=('python2-setuptools')
optdepends=('borgbackup')
source=("https://torsion.org/hg/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('46e6f7e450a705fb13de628a1ce5d52548cf4da25b681bd2843f6a4345d82181')
provides=('borgmatic')
conflicts=('borgmatic')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 sample/config "$pkgdir/etc/$pkgname/config.example"
  install -D -m644 sample/excludes "$pkgdir/etc/$pkgname/excludes.example"
  install -D -m644 sample/atticmatic.cron "$pkgdir/etc/$pkgname/atticmatic.cron.example"
  install -D -m644 sample/borgmatic.cron "$pkgdir/etc/$pkgname/borgmatic.cron.example"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
