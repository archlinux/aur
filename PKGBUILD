# Maintainer: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=ttf-aenigma
pkgver=20080510
pkgrel=3
pkgdesc="465 free TrueType fonts by Brian Kent"
arch=('any')
url="http://www.aenigmafonts.com"
license=('Freeware')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
install=$pkgname.install
source=('http://ftp.debian.org/debian/pool/main/t/ttf-aenigma/ttf-aenigma_0.0.20080510.dfsg-2_all.deb')
md5sums=('957332d9c605982b88f0a8f73f73b6c9')

build() {
  echo "Extracting DEB..."
  cd "$startdir"
  7z x "$startdir/ttf-aenigma_0.0.20080510.dfsg-1_all.deb" -o"$srcdir" -y > /dev/null
  echo "Extracting TAR..."
  cd "$srcdir"
  tar -xf "data.tar" > /dev/null
}

package() {
  cd "$srcdir/usr/share/fonts/truetype/aenigma"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
}

