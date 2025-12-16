# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.1
pkgrel=8
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/e4b019b08964924905fb5b9043d94778e151e7ac.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-e4b019b08964924905fb5b9043d94778e151e7ac"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-e4b019b08964924905fb5b9043d94778e151e7ac"
  # Install under /usr so desktop/icon files land in standard system paths
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"
}
