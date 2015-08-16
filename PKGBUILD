# Maintainer: Schnouki <thomas.jost@gmail.com>
pkgname=mkbold-mkitalic
pkgver=0.11
pkgrel=1
pkgdesc="Make X11 BDF font bold and italic"
arch=(i686 x86_64)
url="http://hp.vector.co.jp/authors/VA013651/freeSoftware/mkbold-mkitalic.html"
license=('custom:X11')
depends=('glibc')
source=(http://hp.vector.co.jp/authors/VA013651/lib/$pkgname-$pkgver.tar.bz2)
md5sums=('2384f0eb2e0d2d8f70ee292b81522619')
sha1sums=('293e60e632abd924c93a16a07a6232c08a8f5e16')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README" || return 1

  make || return 1
  make prefix="/usr" DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
