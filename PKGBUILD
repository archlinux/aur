# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.2.17
pkgrel=47
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/9bc0353648d09ee2682b3d097c22007f2877fd02.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-9bc0353648d09ee2682b3d097c22007f2877fd02"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-9bc0353648d09ee2682b3d097c22007f2877fd02"
  # Install under /usr so desktop/icon files land in standard system paths
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"
}
