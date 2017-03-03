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
            '6119c35e80500aff61e4041f4b147f66f091c8976f695cee191e58108a0de4c411bf24fa79bde1dd3f71f4bfe0999a424395fa164908f741f292537b7e387d79')

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
