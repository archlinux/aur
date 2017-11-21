# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.3
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
sha512sums=('c283dec11ada8249149a7476ed8c1db90b2eb51ff05b54628322e9f02c3cc08559725461800a9cb0579251858c02d2ee5bb8096cd7661b66c52094b936eab72b'
            '753925b90f49fb1183a74b601d9876138c1be90cedb342472072d5bbdaadfafd81e9dac6c13e3dc57d6284301e0bd5d94520118cc61e6fae6e2a9ab0b8e92eb4')

build() {
  cd "$pkgname-$pkgver"
  qmake redshift-qt.pro
  make
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 redshift-qt "$pkgdir/usr/bin/redshift-qt"
  install -Dm644 "$srcdir/redshift-qt.desktop" "$pkgdir/usr/share/applications/redshift-qt.desktop"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
