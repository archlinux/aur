# Maintainer: Justin Dray <justin@dray.be>
# Contributor: Andy Kluger <gmail: evilgnome>
# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Contributor: Bastien Dejean <baskerville@lavabit.com>

pkgname=libicns
pkgver=0.8.1
pkgrel=2
pkgdesc='Library for manipulating Mac OS X icon files'
arch=('i686' 'x86_64')
url='http://icns.sourceforge.net'
license=('LGPL' 'GPL')
depends=('libpng' 'jasper')
provides=("icns2png=$pkgver")
conflicts=('icns2png')
replaces=('icns2png')
options=(!libtool)
source=("http://downloads.sf.net/icns/${pkgname}-${pkgver}.tar.gz")
md5sums=('7a9b74b84ce08c5b11bdee3cad296dd3')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
