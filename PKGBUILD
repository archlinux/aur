# Maintainer : chrisl echo archlinux@c2h0r1i2s4t5o6p7h8e9r-l3u4n1a.com|sed 's/[0-9]//g'
# Contributor: Leen Jewel <leenjewel@gmail.com>

pkgname=webbench
pkgver=1.5
pkgrel=4
pkgdesc="A very simple tool for benchmarking WWW or proxy servers. Uses fork() for simulating multiple clients"
arch=(i686 x86_64)
url="http://home.tiscali.cz/~cz210552/webbench.html"
license=('GPL')
makedepends=('ctags')
source=(http://ibiblio.org/pub/Linux/apps/www/servers/$pkgname-$pkgver.tar.gz)
md5sums=('8d02ef80b6478f33ef9bd8849c867cf3')

build() {
  cd $startdir/src/$pkgname-$pkgver
  CPPFLAGS=-I/usr/include/tirpc make || return 1
}

package() {
  cd $startdir/src/$pkgname-$pkgver
  install -Dm755 webbench $pkgdir/usr/bin/webbench
}
