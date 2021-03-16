# Maintainer: grimi↲
# Contributor: Daniel Fiser <danfis@danfis.cz>

pkgname=burn-cd
pkgver=1.8.1
pkgrel=2
pkgdesc="Smart console frontend for the cdrkit/cdrtools & dvd+rw-tools."
arch=(any)
url="http://burn-cd.sourceforge.net/"
license=('GPL')
depends=('cdrtools' 'dvd+rw-tools' 'python')
#source=("http://downloads.sourceforge.net/burn-cd/$pkgname-$pkgver.gz")
source=("$pkgname-$pkgver.tar.gz::https://github.com/aglyzov/$pkgname/archive/$pkgver.tar.gz"
        "burn-cd.patch")
sha256sums=('8445937d904cf36e690764b1956e6736d4729cf639bc237a67df09d2f24218b2'
            '39746a189d20a4731214e3552ab4e5272f382d167620eadf0379547e1c8559e4')


prepare() {
   cd $pkgname-$pkgver
   patch -Np0 -i ../burn-cd.patch
}

package() {
  cd $pkgname-$pkgver
  install -Dm 644 dotburn-cd.conf "$pkgdir"/etc/burn-cd.conf
  install -Dm 755 $pkgname-$pkgver "$pkgdir"/usr/bin/$pkgname
}

