# $Id$
# Maintainer: Allen Zhong <moeallenz@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=mod_fcgid-lagacy
pkgver=2.3.9
pkgrel=1
pkgdesc="A FastCGI module for Apache HTTP Server, build with apache httpd 2.2"
license=('APACHE')
arch=('i686' 'x86_64')
url="http://httpd.apache.org/mod_fcgid/"
depends=('apache22')
conflicts=('mod_fcgid')
source=(http://www.apache.org/dist/httpd/mod_fcgid/mod_fcgid-$pkgver.tar.bz2{,.asc})
sha1sums=('f0b6d87dfcfe18b318905a3f91274051f3f17945'
          'SKIP')

build() {
  cd mod_fcgid-$pkgver
  ./configure.apxs 
  make
}

package() {
  cd mod_fcgid-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}/usr/share"
  rm -rf "${pkgdir}/etc"
}
