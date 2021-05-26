# Maintainer: Emma Caldeira <kiito@tilde.team>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Ryan Coyner <rcoyner@gmail.com>

pkgname=mod_wsgi
pkgver=4.8.0
pkgrel=2
pkgdesc='Python WSGI adapter module for Apache'
arch=('x86_64')
url='http://www.modwsgi.org/'
license=('APACHE')
depends=('apache' 'python')
conflicts=('mod_wsgi2')
makedepends=('apache' 'python')
install='mod_wsgi.install'
source=($pkgname-$pkgver.tar.gz::"https://codeload.github.com/GrahamDumpleton/mod_wsgi/tar.gz/$pkgver")
sha256sums=('34cf42ca0069041c42dbb429560df1aab01a393d677060701754156a9fcfb8bc')

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
