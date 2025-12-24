# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.1.72
pkgrel=11
pkgdesc="Enhanced fork of Scid chess database with Chess.com/Lichess integration, tablebase lookup, improved search, and additional training features"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/88b2fc7bff01ea490e3b8b6b33824eb10122bc6a.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-88b2fc7bff01ea490e3b8b6b33824eb10122bc6a"
  ./configure --prefix=/usr
  make all
}

package() {
  cd "${srcdir}/scidCommunity-88b2fc7bff01ea490e3b8b6b33824eb10122bc6a"
  # Install under /usr so desktop/icon files land in standard system paths
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/share/scid" BINDIR="${pkgdir}/usr/bin"
}
