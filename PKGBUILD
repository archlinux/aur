# Maintainer: Isaac Dupree <antispam@idupree.com>

pkgname=sassc
pkgver=3.2.5
pkgrel=1
pkgdesc="C implementation of Sass CSS preprocessor."
arch=('i686' 'x86_64')
url="http://libsass.org/"
license=('MIT')
depends=('libsass')
source=(https://github.com/sass/${pkgname}/archive/${pkgver}.tar.gz)
sha256sums=('65d746ed7512754fe5cf7f5c84317e366c564fecb99cd12d901910c4cbe1c3f5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
