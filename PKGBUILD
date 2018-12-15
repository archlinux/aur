# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Contributor: Kaiting Chen <kaiting.chen@kiwilight.com>

pkgname='librelp'
pkgver=1.3.0
pkgrel=1
pkgdesc="The Reliable Event Logging Protocol"
url="https://www.rsyslog.com/librelp/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('gnutls')
source=("http://download.rsyslog.com/librelp/librelp-${pkgver}.tar.gz")
sha256sums=('9f24a2fc5749b20c1fd4902332c853e3b06b8bf61b830173252815639b4de9f5')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
