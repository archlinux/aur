# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Dag Odenhall <dag.odenhall@gmail.com>
# Contributor: Giorgio Lando <patroclo7@gmail.com>

pkgname=sic
pkgver=1.2
pkgrel=1
pkgdesc='An extremely simple IRC client.'
license=('MIT')
arch=('i686' 'x86_64')
url='http://tools.suckless.org/sic'
depends=('glibc')
source=("http://dl.suckless.org/tools/$pkgname-$pkgver.tar.gz")
md5sums=('eb099e790c3ce7866df50d3fe1a52c25')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i "s/CFLAGS = /CFLAGS = ${CFLAGS} /" config.mk
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
