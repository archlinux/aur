# Maintainer: Patrick Melo <patrick@patrickmelo.eti.br>

pkgname=ttf-aenigma
pkgver=20080510
pkgrel=2
pkgdesc="465 free TrueType fonts by Brian Kent"
arch=('any')
url="http://www.aenigmafonts.com"
license=('Freeware')
depends=('fontconfig' 'xorg-font-utils')
makedepends=('p7zip')
install=$pkgname.install
source=('http://ftp.debian.org/debian/pool/main/t/ttf-aenigma/ttf-aenigma_0.0.20080510.dfsg-1_all.deb')
md5sums=('acf30eaa480ece4bc0dad102332c9256')

build() {
  echo "Extracting DEB..."
  cd "$startdir"
  7z x "$startdir/ttf-aenigma_0.0.20080510.dfsg-1_all.deb" -o"$srcdir" -y > /dev/null || return 1
  echo "Extracting TAR..."
  cd "$srcdir"
  tar -xf "data.tar" > /dev/null || return 1
}

package() {
  cd "$srcdir/usr/share/fonts/truetype/aenigma"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/" || return 1
}

