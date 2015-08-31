# Contributor: timetrap <timetrap@gmail.com>
# Contributor: SpookyET <spookyet@gmail.com>

pkgname=bcwipe
pkgver=1.9
pkgrel=13
pkgdesc="Securely erase data from magnetic and solid-state memory"
arch=('i686' 'x86_64')
url="http://www.jetico.com/download"
license=('unknown')
source=(http://www.jetico.com/linux/BCWipe-$pkgver-$pkgrel.tar.gz)
md5sums=('090bc261db969ebae7f3cec145238779')

build() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  ./configure --prefix=/usr
  make root="$pkgdir"
}

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"

  make DESTDIR=${pkgdir} install
}

# vim:set ts=2 sw=2 et:
