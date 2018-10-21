# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>

pkgname='librelp'
pkgver=1.2.18
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('a34c8fc98bf8eef2a5baf635a0f71813cce93b1185aa03648e31b5af60b7393f')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
