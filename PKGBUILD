# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Maintainer: Kevin Piche <kevin@archlinux.org>

pkgname=gob2
pkgver=2.0.20
pkgrel=2
pkgdesc="GTK Object Builder (GOB) is a simple preprocessor for easily creating GTK objects"
arch=(x86_64)
license=('GPL')
depends=('glib2')
url="http://www.jirka.org/gob.html"
source=(http://ftp.5z.com/pub/gob/${pkgname}-${pkgver}.tar.xz)
sha256sums=('f7ee84c07ca88ae96e5a60461957cc4dd0aa69d61804433d1c85de3d50be8026')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
}
