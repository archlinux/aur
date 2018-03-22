# Maintainer: Luca P <meti at lplab.net>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Denis Wernert <deniswernert@gmail.com>

pkgname=liblogging
pkgver=1.0.6
pkgrel=2
pkgdesc="easy to use, portable, open source library for system logging"
url="http://www.liblogging.org/"
arch=('x86_64' 'i686')
license=('GPL')
depends=('systemd')
makedepends=('python-docutils')
options=('strip' 'zipman' '!libtool')
source=("http://download.rsyslog.com/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('338c6174e5c8652eaa34f956be3451f7491a4416ab489aef63151f802b00bf93')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/${pkgname}-${pkgver}
  make install DESTDIR="$pkgdir"
}
