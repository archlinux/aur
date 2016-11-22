# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=fonts-ldco
filename=LDCOFonts.rar
pkgver="20161122"
pkgrel=2
pkgdesc="set of Hebrew fonts by Louis Davis and Co. in OTF and TTF formats."
arch=('any')
url="http://www.ldcodesign.com/%D7%98%D7%99%D7%A4%D7%95%D7%92%D7%A8%D7%A4%D7%99%D7%94/"
license=('OFL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)
makedepends=('unrar')
source=("http://ldcodesign.com/downloads/typography/$filename" fonts-ldco.install)
sha256sums=('e80f58a29e0cd0e07bb76d6cd851749e3ffc3c7a02ec9cfbb3b4bb2434481d22'
		'745a621aa8d8a9f8ef6cd017da94e0103db9e8c3e749dcc8613139d1a57a2fe0')
noextract=("$filename")

package() {

  unrar x $filename $srcdir

  install -dm 755 $pkgdir/usr/share/fonts/{OTF,TTF}
  install -dm 755 $pkgdir/usr/share/licenses/fonts-ldco
  install -Dm 644 $srcdir/*/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 $srcdir/*/*.otf $pkgdir/usr/share/fonts/OTF
  
  install -Dm 644 $srcdir/$(ls $srcdir | head -1)/{OFL.txt,ofl-faq.txt} $pkgdir/usr/share/licenses/fonts-ldco

}
