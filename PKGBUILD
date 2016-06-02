# Maintainer: Alexander Görtz <aur@nyloc.de>

pkgname=borgmatic
_pkgname=atticmatic
pkgver=0.1.8
pkgrel=1
pkgdesc="A simple Python wrapper script for the borg (and attic) backup software."
arch=('any')
url="http://torsion.org/atticmatic/"
license=('GPL3')
depends=('borg')
makedepends=('python2-setuptools')
optdepends=('attic')
source=("https://torsion.org/hg/$_pkgname/archive/$pkgver.tar.gz")
provides=('atticmatic')
conflicts=('atticmatic')
sha256sums=('db563b154638c426a8a055dca015d90c19ee08ce69c6a6a0783ddc038646e12e')


package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 sample/config "$pkgdir/etc/$pkgname/config.example"
  install -D -m644 sample/excludes "$pkgdir/etc/$pkgname/excludes.example"
  install -D -m644 sample/atticmatic.cron "$pkgdir/etc/$pkgname/atticmatic.cron.example"
  install -D -m644 sample/borgmatic.cron "$pkgdir/etc/$pkgname/borgmatic.cron.example"
  python setup.py -q install --root="$pkgdir" --optimize=1
}
