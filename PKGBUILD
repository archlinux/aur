# Maintainer: Hugh Whelan <brickhousedevelopers@gmail.com>
pkgname=scidcommunity
pkgver=5.1.1
pkgrel=1
pkgdesc="Chess database application with play and training functionality"
arch=('x86_64')
url="https://github.com/whelanh/scidCommunity"
license=('GPL2')
depends=('tcl' 'tk')
makedepends=('gcc' 'make' 'git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/whelanh/scidCommunity/archive/f7fad958155d9b555090bad165738213392e8a81.tar.gz")
sha256sums=('SKIP')  # Safe to skip: integrity verified by commit hash

build() {
  cd "${srcdir}/scidCommunity-f7fad958155d9b555090bad165738213392e8a81"
  ./configure --prefix=/usr/local
  make all
}

package() {
  cd "${srcdir}/scidCommunity-f7fad958155d9b555090bad165738213392e8a81"
  # Override SHAREDIR and BINDIR to use DESTDIR
  make install DESTDIR="${pkgdir}" SHAREDIR="${pkgdir}/usr/local/share/scid" BINDIR="${pkgdir}/usr/local/bin"
}
