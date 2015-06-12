# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
pkgname=util-say
pkgver=3.2.1
pkgrel=1
pkgdesc="Tools for creating ponies for cowsay and cowsay-like programs"
arch=('any')
url="https://github.com/maandree/util-say"
license=('GPL3')
depends=('java-runtime>=6')
makedepends=('java-environment>=6' 'bash')
optdepends=('imagemagick: allows imgsrcrecovery to read frames in GIF files' 'perl: required for cowsay import support')
provides=('util-say')
conflicts=('util-say')
source=(https://github.com/maandree/util-say/archive/$pkgver.tar.gz)
sha256sums=(38539e74d97afb719ad71f694ff08fc024ae71a33f60dd5d94e163d5bc66e98f)

build() {
  cd "$srcdir/util-say-$pkgver"
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd "$srcdir/util-say-$pkgver"
  make DESTDIR="$pkgdir/" install
}
