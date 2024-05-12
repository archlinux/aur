# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Co-maintainer: GI_Jack <GI_Jack@hackermail.com>

#website is gone, but file remains on debian servers

pkgname=ttf-aenigma
pkgver=20080510
pkgrel=9
pkgdesc="465 free TrueType fonts by Brian Kent"
arch=('any')
url="https://www.myfonts.com/collections/brian-kent"
license=('custom')
depends=('fontconfig')
source=('https://ftp.debian.org/debian/pool/main/t/ttf-aenigma/ttf-aenigma_0.0.20080510.dfsg-2_all.deb'
	'LICENSE')
sha512sums=('9949b4213b8acc98e394a8978762f8cc481b0b7fa80a45d49ec7b193145ae67a81c1cbb4004e25065aa91e1f29a161ab027aa7caa4b016cdb84a12ff860e78de'
            'a66cd266ffa6a34c5e0277c5dd510273c969860c6fc6ca82b617a2df6140dcc14702f0a52c6b88abe37ec5cc004cc7ce224e667626c270480dcd6e9088e984ef')

build() {
  echo "Extracting TAR..."
  tar xzf "data.tar.gz" > /dev/null
}

package() {
  cd "$srcdir/usr/share/fonts/truetype/aenigma"
  mkdir -p "$pkgdir/usr/share/fonts/TTF/"
  install -m644 *.ttf "$pkgdir/usr/share/fonts/TTF/"
  cd "$srcdir"
  install -Dm644  LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}

