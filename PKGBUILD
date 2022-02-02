# Maintainer: Robert Falkenberg <robert.falkenberg@tu-dortmund.de>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: kevku <kevku@msn.com>
# Contributor: Rene Pärts <rene87@hot.ee>

pkgname=libp11-static
_pkgname=libp11
pkgver=0.4.11
pkgrel=1
pkgdesc="A library implementing a small layer on top of the PKCS11 API (with static libs)"
arch=('x86_64')
url="https://github.com/OpenSC/libp11/wiki"
license=('LGPL')
depends=('openssl')
options=('staticlibs')
provides=("libp11=$pkgver")
conflicts=('libp11')
source=("https://github.com/OpenSC/${_pkgname}/releases/download/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.gz"{,.asc})
sha256sums=('57d47a12a76fd92664ae30032cf969284ebac1dfc25bf824999d74b016d51366'
            'SKIP')
validpgpkeys=('AC915EA30645D9D3D4DAE4FEB1048932DD3AAAA3')

build() {
  cd "$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

