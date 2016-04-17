# Maintainer: Shawn Fisher <fishbot@gmail.com>

pkgname=opennhrp
pkgver=0.14
pkgrel=1
pkgdesc="An opensource NHRP implementation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opennhrp/"
license=('custom')
depends=('linux>=3.7.4-1' 'bash' 'c-ares')
source=("http://downloads.sourceforge.net/project/opennhrp/opennhrp/$pkgname-$pkgver.tar.bz2"
        'MIT-LICENSE.txt')
md5sums=('62e8f16dd3bdf0600e43fcb37aa40462'
         'fcde66d6d3a34d2a5c48fcef0b0be04c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
  install -Dm644 "$srcdir/MIT-LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/MIT-LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
