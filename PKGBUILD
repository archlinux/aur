# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: masutu <masutu dot arch at gmail dot com>
pkgname=ciwiki
pkgver=3.0.5
pkgrel=2
pkgdesc="Personnal or familly wiki with low ressource requirement."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/ciwiki/"
license=('GPL')
depends=('bash' 'glibc')
source=(https://sourceforge.net/projects/ciwiki/files/ciwiki-3.0.5.tar.gz)
md5sums=('ab12779f45dd58054db0c66a24b157b9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm 0644 README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
