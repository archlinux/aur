# Maintainer: Marco Dinis <marcoandredinis@gmail.com>
pkgname=klish
pkgver=2.1.4
pkgrel=1
pkgdesc="A modular framework for implementing a CISCO-like CLI. The klish is a fork of clish 0.7.3 project."
arch=('i686' 'x86_64')
url="http://libcode.org/projects/klish"
license=('BSD')
depends=('gcc-libs' 'zlib' 'expat')
options=('!libtool')
provides=('clish')
conflicts=('clish')
source=(http://libcode.org/attachments/download/70/$pkgname-$pkgver.tar.xz)
md5sums=('57a0b39b6e0a450007ee9e0b2ff50f03')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENCE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
