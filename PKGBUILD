# Maintainer: 4leks4ndr <orthodox dot tk at gmail dot com>

pkgname=m17n-cu
pkgver=4b70741
pkgrel=2
pkgdesc='Church Slavic data for m17n database'
arch=('any')
url='https://github.com/typiconman/m17n-cu'
license=('GPL')
depends=('ibus-m17n')
#install=$pkgname.install
source=("git+$url.git#commit=$pkgver"
        "http://www.ponomar.net/files/docen.pdf")

#prepare() {
#  cd "${srcdir}/${pkgname}"
#  patch -p0 -i "$srcdir/Makefile.patch"
#}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/license/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/"
  install -Dm644 INSTALL "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 RUSSIAN "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/docen.pdf" "$pkgdir/usr/share/doc/$pkgname/"
}

md5sums=('SKIP'
         'f38db7908493cae9e08327b4e501f6ee')
