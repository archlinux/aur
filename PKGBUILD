# Maintainer: Christoph Wiechert <wio@psitrax.de>
pkgname=purple-facebook
pkgver=25
pkgrel=1
VERSION=66ee77378d82
pkgdesc="Facebook Messenger protocol into pidgin, finch, and libpurple"
url="https://github.com/jgeboski/purple-facebook"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpurple' 'json-glib')

makedepends=('make')
source=("https://github.com/jgeboski/purple-facebook/releases/download/${VERSION}/purple-facebook-${VERSION}.tar.gz")
md5sums=("bf8c2beb53d568cf61fcbb5df5fdd06a")

build() {
  cd "${srcdir}/purple-facebook-${VERSION}"
  ./configure
}

package() {
  cd "${srcdir}/purple-facebook-${VERSION}"
  make DESTDIR="${pkgdir}" install
  libtool --finish /usr/lib/purple-2
}

# vim:set ts=2 sw=2 et:
