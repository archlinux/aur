# Contributor: philomath <philomath868 AT gmail DOT com>
# Contributor: Arthur Danskin <arthurdanskin@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=dadadodo
pkgver=1.04
pkgrel=3
pkgdesc="A program that analyses texts for word probabilities, and then generates random sentences based on that."
url="http://www.jwz.org/dadadodo/"
license=('MIT')
arch=('i686' 'x86_64')
source=("http://www.jwz.org/dadadodo/$pkgname-$pkgver.tar.gz")
md5sums=('d3ff69c4e71c328586b1c6ca2130a4b3')
sha1sums=('20b3c802db70c8c4fddf751e668aa6218c085643')
sha256sums=('2e0ebb90951c46ff8823dfeca0c9402ce4576b31dd8bc4b2740a951aebb8fcdf')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
  sed 11q dadadodo.c > LICENSE
}

package() {
  cd $srcdir/$pkgname-$pkgver
  install -D -m755 dadadodo $pkgdir/usr/bin/dadadodo
  install -D -m644 LICENSE $pkgdir/usr/share/licenses/dadadodo/LICENSE
}

