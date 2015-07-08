# Maintainer: Alan Berndt <alan@eatabrick.org>
pkgname=secretfs
pkgver=0.0.2
pkgrel=3
pkgdesc="A secret sharing filesystem"
url="http://www.digital-scurf.org/software/secretfs"
license='MIT'
arch=('i686' 'x86_64')
depends=('libgfshare' 'fuse')
provides=('secretfs')
source=('https://github.com/bentglasstube/secretfs/archive/v0.0.2.tar.gz')
sha1sums=('a790bf6afdcfd65baa73b293407e896dd75bc4f3')

build() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/src"
  make DESTDIR="$pkgdir/" install
  install -D -m644 ../COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
