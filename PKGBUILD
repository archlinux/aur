# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Mellor

pkgname=vstream-client
pkgver=1.2.1.1
pkgrel=3
pkgdesc="A fork off of the vstream library from the tivo-mplayer project."
arch=('i686' 'x86_64')
license=('GPL')
url='http://vstream-client.googlecode.com'
depends=('glibc')
makedepends=()
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/vstream-client/vstream-client-1.2.1.1.tar.bz2")
sha256sums=('caf3058b0afc0e8c01d752abf7a115a9b647fac1c6e9190a9aae8f79d4dcf09b')

build() {
  cd "vstream-client-${pkgver}"
  ./configure --prefix="${pkgdir}/usr"
  make vstream-client
}

package() {
  cd "vstream-client-${pkgver}"
  make INSTALL='install -D' install
}
