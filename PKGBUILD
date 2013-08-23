# Contributor: Anton Leontyev <bunder /at/ t-25.ru>
pkgname=ttf-georgewilliams
pkgver=1.0
pkgrel=1
pkgdesc="Free unicode TrueType fonts by George Williams: Caliban, Caslon Roman, Cupola"
arch=('any')
license=('BSD')
url="http://fontforge.sourceforge.net/sfds/index.html" 
makedepends=('unzip')
depends=('fontconfig' 'xorg-font-utils')
#depends=('xorg-fonts-encodings' 'xorg-fonts-alias' 'xorg-font-utils' 'fontconfig')
install=ttf-georgewilliams.install
source=(http://ftp.debian.org/debian/pool/main/g/gw-fonts-ttf/gw-fonts-ttf_1.0.orig.tar.gz)
md5sums=('298c1e66a86ab25f013cfb68f7d9e0ba')

build() {
  cd $srcdir/gw-fonts-ttf-$pkgver
  install -dm755  ${pkgdir}/usr/share/fonts/TTF

  gunzip -f Caliban.ttf.gz
  unzip -o CasUni.zip
  unzip -o CupUniTTF.zip
  
  install -m644 Caliban.ttf $pkgdir/usr/share/fonts/TTF/Caliban.ttf
  install -m644 CUPOU___.TTF $pkgdir/usr/share/fonts/TTF/CupolaRegular.ttf
  install -m644 CUPOULI_.TTF $pkgdir/usr/share/fonts/TTF/CupolaItalic.ttf
  install -m644 CaslonRoman.ttf $pkgdir/usr/share/fonts/TTF/CaslonRoman.ttf
  install -m644 CaslonItalic.ttf $pkgdir/usr/share/fonts/TTF/CaslonItalic.ttf
  install -m644 CaslonBold.ttf $pkgdir/usr/share/fonts/TTF/CaslonBold.ttf
}