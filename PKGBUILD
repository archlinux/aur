# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>

pkgname='librelp'
pkgver=1.2.14
pkgrel=2
pkgdesc="The Reliable Event Logging Protocol"
url="http://www.librelp.com/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('11f6241a4336358a33bfdadd43ef299e8258db0a5243d0c164499c6b85ae5955')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
