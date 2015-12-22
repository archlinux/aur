# Maintainer: Christoph Wiechert <wio@psitrax.de>
pkgname=purple-facebook
pkgver=18
pkgrel=1
VERSION=50bb40c42245
pkgdesc="Facebook Messenger protocol into pidgin, finch, and libpurple"
url="https://github.com/jgeboski/purple-facebook"
arch=('x86_64' 'i686')
license=('GPL')
depends=('libpurple' 'json-glib')

makedepends=('make')
source=("https://github.com/jgeboski/purple-facebook/releases/download/${VERSION}/purple-facebook-${VERSION}.tar.gz")
md5sums=("2635fb0600eca65f6560f186c5578a33")

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
