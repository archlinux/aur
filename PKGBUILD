# Maintainer: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Maintainer: Benoît Rouits <brouits@free.fr>
pkgname=csv2latex
pkgver=0.23.1
pkgrel=1
pkgdesc="A csv to LaTeX file converter"
arch=('i686' 'x86_64')
url="http://brouits.free.fr/csv2latex/"
license=('GPL2')
depends=('glibc')
source=(http://brouits.free.fr/csv2latex/$pkgname-$pkgver.tar.gz)
md5sums=('34c01f986f7f644406746a5722c95e52')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d m755 "$pkgdir"/usr/{bin,share/man/man1}
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
