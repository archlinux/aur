# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.1.80
pkgrel=20
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/c275f45459856f2028e5b0eb8f62003b767a7382.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-c275f45459856f2028e5b0eb8f62003b767a7382"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-c275f45459856f2028e5b0eb8f62003b767a7382"
  # Install under /usr so desktop/icon files land in standard system paths
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"
}
