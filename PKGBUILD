# Maintainer: Christoph Wiechert <wio@psitrax.de>
pkgname=purple-facebook
pkgver=0.9.0
pkgrel=2
epoch=1
COMMIT=c9b74a765767
pkgdesc="Facebook Messenger protocol into pidgin, finch, and libpurple"
url="https://github.com/jgeboski/purple-facebook"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpurple' 'json-glib')

makedepends=('make')
source=("https://github.com/dequis/purple-facebook/releases/download/v$pkgver-$COMMIT/purple-facebook-$pkgver-$COMMIT.tar.gz")

md5sums=("52b3b21a7a2ef6fca450876830ad9aed")

build() {
  cd "${srcdir}/purple-facebook-$pkgver-${COMMIT}"
  ./configure
}

package() {
  cd "${srcdir}/purple-facebook-$pkgver-${COMMIT}"
  make DESTDIR="${pkgdir}" install
  libtool --finish /usr/lib/purple-2
}

# vim:set ts=2 sw=2 et:
