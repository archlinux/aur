# Maintainer : gls < ghostlovescorebg at gmail dot com >

pkgname=csync2
pkgver=2.0
pkgrel=2
arch=('i686' 'x86_64')
pkgdesc="Asynchronous cluster syncronisation tool based on librsync and inspired by Unison"
url="http://oss.linbit.com/csync2/"
license=('GPL')
depends=('librsync' 'gnutls')
optdepends=('sqlite: for sqlite backend')
source=(http://oss.linbit.com/csync2/${pkgname}-${pkgver}.tar.gz)
sha256sums=('11cb37380fb185bce0c22b804fec9b01c385d9d83cc528cfd48d748453834fa2')

build() {
  cd ${pkgname}-${pkgver}

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sbindir=/usr/bin \
    --sysconfdir=/etc \
    --localstatedir=/var

  make 
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
