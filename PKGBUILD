# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>

pkgname='librelp'
pkgver=1.2.15
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="http://www.librelp.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('a931832d9056660feee76d52195b21d4e9e06d5ec8e96b26af44e998529da999')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
