# Maintainer: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

pkgname=omi
pkgver=1.1.0
pkgrel=1
pkgdesc='Open Management Infrastructure (OMI) is an open source project to further the development of a production quality implementation of the DMTF CIM/WBEM standards.'
arch=('i686' 'x86_64')
url='https://github.com/Microsoft/omi'
license=('MIT')
source=("https://github.com/Microsoft/omi/archive/v$pkgver-0.tar.gz")
sha1sums=('267d77283c773b1da8cf0fed725191276ed0afc6')

build() {
  cd "$srcdir/$pkgname-$pkgver-0/Unix"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver-0/Unix"
  make install DESTDIR="$pkgdir"

  install -Dm 644 "$srcdir/$pkgname-$pkgver-0/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
