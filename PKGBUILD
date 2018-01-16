# Contributor: foutrelis 
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: SpepS <dreamspepser at yahoo dot it>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=libsmf
pkgver=1.3
pkgrel=6
pkgdesc='A BSD-licensed C library for handling SMF ("*.mid") files.'
arch=('x86_64')
url="http://sourceforge.net/projects/libsmf/"
license=('custom:BSD')
depends=('glib2' 'readline')
source=("http://downloads.sourceforge.net/project/libsmf/libsmf/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('eb698f1bc0bad9d5bce4c10386347486')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
