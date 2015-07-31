# Maintainer: Christoph Wiechert <wio@psitrax.de>
pkgname=purple-facebook
pkgver=27833e4fcb1f
pkgrel=1
pkgdesc="Facebook Messenger protocol into pidgin, finch, and libpurple"
url="https://github.com/jgeboski/purple-facebook"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpurple' 'json-glib')

makedepends=('make')
source=("https://github.com/jgeboski/purple-facebook/releases/download/${pkgver}/purple-facebook-${pkgver}.tar.gz")
md5sums=("17f88e9eaa7fe11c704287b626b3028b")

build() {
  cd "${srcdir}/purple-facebook-${pkgver}"
  ./configure
}

package() {
  cd "${srcdir}/purple-facebook-${pkgver}"
  make DESTDIR="${pkgdir}" install
  libtool --finish /usr/lib/purple-2
}

# vim:set ts=2 sw=2 et:
