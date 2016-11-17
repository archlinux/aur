# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.2
pkgrel=1
pkgdesc="redshift-gtk rewrite with C++/Qt"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('redshift' 'qt5-base')
provides=('redshift-qt')
conflicts=('redshift-qt')
source=("$pkgname-$pkgver::https://github.com/Chemrat/redshift-qt/archive/v$pkgver.zip"
        "redshift-qt.desktop")
md5sums=('4c8e2bf49c6459c7cb0a2bde9c339b46'
         '9ef24b824bcfb46dbd951074af074772')

build() {
  cd "$pkgname-$pkgver"
  qmake redshift-qt.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 redshift-qt $pkgdir/usr/bin/redshift-qt
  install -Dm644 $srcdir/redshift-qt.desktop $pkgdir/usr/share/applications/redshift-qt.desktop
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

# vim:set ts=2 sw=2 et:
