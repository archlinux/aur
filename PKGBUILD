# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=redshift-qt
pkgver=0.4
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
sha512sums=('b1566c6c912bda278ca8f4ee8411671529d01b50dbee2797cbe8cb25d5a1f055409e1789cbea581637a732f69eb0a2dd4ac8c6037aaeac6e338a30b905b4d97c'
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
