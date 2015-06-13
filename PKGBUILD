# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=jpgcrush
pkgver=0.0.0
pkgrel=2
pkgdesc="Lossless jpeg re-compressor."
arch=('any')
url="http://akuvian.org/"
license=('custom:publicdomain')
depends=('perl-file-slurp' 'libjpeg')
source=(http://akuvian.org/src/$pkgname.tar.gz)
md5sums=('c3c5fb5f228e3f5cced70c6982e0a38e')

build() {
  cd "$srcdir"
  sed -i 's|~/src/perl/|/usr/share/jpgcrush/|g' jpgcrush
}

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/bin/" "$pkgdir/usr/share/jpgcrush/"
  install -Dm644 *.txt      "$pkgdir/usr/share/jpgcrush/"
  install -Dm755 jpgcrush   "$pkgdir/usr/bin/"
  install -Dm755 jpegrescan "$pkgdir/usr/bin/"
}


