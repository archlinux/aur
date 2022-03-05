# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Mellor

pkgname=vstream-client
pkgver=1.2.1.1
pkgrel=4
pkgdesc="A fork off of the vstream library from the tivo-mplayer project."
arch=('x86_64')
license=('GPL')
url='https://code.google.com/archive/p/vstream-client/'
depends=('glibc')
makedepends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/vstream-client/vstream-client-1.2.1.1.tar.bz2")
sha256sums=('caf3058b0afc0e8c01d752abf7a115a9b647fac1c6e9190a9aae8f79d4dcf09b')
options=('debug')

build() {
  cd "vstream-client-${pkgver}"
  ./configure \
    --prefix="${pkgdir}/usr"

  make vstream-client
}

package() {
  make -C "vstream-client-${pkgver}" INSTALL='install -D' install
}
