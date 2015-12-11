# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
# Contributor: Andrew Mellor

pkgname=vstream-client
pkgver=1.2.1.1
pkgrel=2
pkgdesc="A fork off of the vstream library from the tivo-mplayer project."
arch=('i686' 'x86_64')
license=('GPL')
url='http://vstream-client.googlecode.com'
depends=('glibc')
makedepends=()
source=("http://vstream-client.googlecode.com/files/vstream-client-1.2.1.1.tar.bz2")
sha1sums=('16051dd522ac49c22fef54c377e3619d76b28721')

build() {
    cd "vstream-client-${pkgver}"
    ./configure --prefix="${pkgdir}/usr"
    make vstream-client
}

package() {
    cd "vstream-client-${pkgver}"
    make INSTALL='install -D' install
}
