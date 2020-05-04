# Maintainer: Emma Caldeira <kiito@tilde.team>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=mod_wsgi
pkgver=4.7.1
pkgrel=1
pkgdesc='Python WSGI adapter module for Apache'
arch=('x86_64')
url='http://www.modwsgi.org/'
license=('APACHE')
depends=('apache' 'python')
conflicts=('mod_wsgi2')
makedepends=('apache' 'python')
install='mod_wsgi.install'
source=($pkgname-$pkgver.tar.gz::"https://github.com/GrahamDumpleton/mod_wsgi/archive/$pkgver.tar.gz")
sha256sums=('2674e506719afe60fbc0547c832e8948d6caa2e054d40d336309993e6e867d35')

build() {
  cd $pkgname-$pkgver
  ./configure \
    --prefix=/usr \
    --with-apxs=/usr/bin/apxs \
    --with-python=/usr/bin/python
  make
}

package() {
  make -C $pkgbase-$pkgver DESTDIR="$pkgdir" install
}
