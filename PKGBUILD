# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=cstat
pkgver=0.9.9
pkgrel=1
pkgdesc="A tool to gather real-time statistics from Cube and Cube 2 game servers"
arch=('i686' 'x86_64')
url="http://cstat.y7.ath.cx/"
license=('GPL')
depends=('glibc')
source=(http://downloads.sourceforge.net/project/cubestat/$pkgname-$pkgver-src.tar.gz)
md5sums=('b0aaea5be673f2a57046428e6e7f861b')

build() {
  cd $pkgname-$pkgver-src/src

  export CFLAGS+=" -I. -DHAVE_CONFIG_H"

  ./configure --prefix=/usr
  make || return 1
  install -Dm755 cstat "$pkgdir"/usr/bin/cstat
}

# vim:set ts=2 sw=2 et:
