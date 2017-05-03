pkgname=m17n-cu
pkgver=0.2
pkgrel=3
pkgdesc='Church Slavic data for m17n database'
arch=('i686' 'x86_64')
url='https://github.com/typiconman/m17n-cu'
license=('GPL')
depends=('ibus-m17n')
source=("${url}/archive/v.${pkgver}-beta.tar.gz"
        "Makefile.patch"
        "http://www.ponomar.net/files/docen.pdf")

prepare() {
  cd "${srcdir}/${pkgname}-v.${pkgver}-beta"
  patch -p0 -i "$srcdir/Makefile.patch"
}

package() {
  cd "${srcdir}/${pkgname}-v.${pkgver}-beta"
    make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir/usr/share/license/$pkgname"
  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/license/$pkgname/"
  install -Dm644 INSTALL "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 RUSSIAN "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir/docen.pdf" "$pkgdir/usr/share/doc/$pkgname/"
}

md5sums=('6d36b3ba4379044c6d1796d6966c2d8f'
         'f59798203cf716061316fa9a342a5afc'
         '8f704e96e09efdb5ef604952d290c43d')

