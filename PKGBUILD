# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
 
pkgname=cduce
pkgver=0.6.0
pkgrel=1
pkgdesc='CDuce compiler'
arch=('x86_64')
url='http://www.cduce.org/'
license=('MIT')
depends=('libcurl-gnutls' 'pcre')
source=("http://http.us.debian.org/debian/pool/main/c/cduce/cduce_$pkgver-1_amd64.deb")
sha256sums=('9715d1ebafcf3b4aa869044cdf85f6ed5e93cdb97c6a0504024c9c9d39fd2864')

prepare() {
  ar xv cduce_$pkgver*.deb && bsdtar jxf data.tar.xz
}

package() {
  cp -r usr var "$pkgdir/"
  ln -s /usr/lib/libpcre.so "$pkgdir/usr/lib/libpcre.so.3"
}

# vim:set ts=2 sw=2 et:

