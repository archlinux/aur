# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.5
pkgrel=1
pkgdesc="redshift-gtk rewrite with C++/Qt"
arch=('x86_64' 'i686')
url="https://github.com/Chemrat/redshift-qt"
license=('MIT')
depends=('redshift' 'qt5-base')
source=("$pkgname-$pkgver::https://github.com/Chemrat/redshift-qt/archive/v$pkgver.zip"
        "redshift-qt.desktop")
sha512sums=('0d6cc86e105f3082d2e364006e72b053ee957e9ef46f3dc9ba3c4e7f25db51378954ca7c8932c53bdeced1736a25a2ca804b6d7d03d945cfb1409a1a6730002e'
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
