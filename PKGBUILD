# Maintainer: yantene <contact at yantene.net>
pkgname=takt
pkgver=0.310
pkgrel=2
pkgdesc="A text-based music programming language designed by Satoshi Nishimura"
arch=('x86_64')
url="http://takt.sourceforge.net/"
license=('GPL' 'LGPL')
depends=('readline' 'alsa-lib')

source=("https://downloads.sourceforge.net/project/${pkgname}/${pkgname}-${pkgver}-src.tar.gz")

md5sums=('a128a4d295e91cfcde1f1a8a17d0ed26')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
