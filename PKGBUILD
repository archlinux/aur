# Maintainer: Sebastian Ziebarth <mauspacker@posteo.de>
pkgname=virglrenderer
pkgver=0.5.0
pkgrel=1
pkgdesc="VirGL virtual OpenGL renderer"
arch=('x86_64' 'i686')
url="https://virgil3d.github.io/"
license=('MIT')
depends=('libepoxy' 'mesa')
makedepends=('python2')
source=("http://www.freedesktop.org/software/virgl/${pkgname}-${pkgver}.tar.bz2"
        "http://www.freedesktop.org/software/virgl/${pkgname}-${pkgver}.tar.bz2.sig")
validpgpkeys=('10A6D91DA1B05BD29F6DEBAC0C74F35979C486BE')
md5sums=('29804ecd1713e298828f9d1642eb289d' SKIP)
sha1sums=('c3e94299b6d16b8ca05d1aa511a89b26c66393b3' SKIP)
sha256sums=('a1955a3433b6a51c3ee5def007b1973da22807b91437a2dbcdf664bf2c9240b6' SKIP)


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
