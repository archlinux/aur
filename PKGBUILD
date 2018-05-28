# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=ttf-aenigma
pkgver=20080510
pkgrel=4
pkgdesc="465 free TrueType fonts by Brian Kent"
arch=('any')
url="http://www.aenigmafonts.com"
license=('custom')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
source=('http://ftp.debian.org/debian/pool/main/t/ttf-aenigma/ttf-aenigma_0.0.20080510.dfsg-2_all.deb')
md5sums=('957332d9c605982b88f0a8f73f73b6c9')

build() {
  echo "Extracting TAR..."
  tar xzf "data.tar.gz" > /dev/null
}

package() {
  cd "$srcdir/usr/share/fonts/truetype/aenigma"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  cd "$srcdir"
  install -Dm644  ../LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

