# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Contributor: Bartek Iwaniec <hash87 [at] gmail [dot] com>

pkgname=librtfcomp
pkgver=1.3
pkgrel=2
pkgdesc="SynCE librtfcomp library"
arch=(x86_64)
license=('GPL')
url="http://www.synce.org/"
depends=(pyrex)
source=(http://downloads.sourceforge.net/synce/${pkgname}-${pkgver}.tar.gz)
md5sums=('7aa26fc1dd2dd2ef64043fae573c69dc')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
  install -dm0755 "$pkgdir"/usr/bin
  install -m0755 tests/{to,from}rtf "$pkgdir"/usr/bin
}
