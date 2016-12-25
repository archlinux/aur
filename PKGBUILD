# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=fonts-ldco
filename=LDCOFonts.tar.gz
pkgver="20161225"
pkgrel=1
pkgdesc="set of Hebrew fonts by Louis Davis and Co. in OTF and TTF formats."
arch=('any')
url="http://www.ldcodesign.com/%D7%98%D7%99%D7%A4%D7%95%D7%92%D7%A8%D7%A4%D7%99%D7%94/"
license=('OFL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)

source=("http://ldcodesign.com/downloads/typography/$filename" $pkgname.install)
sha256sums=('82b9472a8550f926b35a569a9b140c34245dd4bbc5dde6604c186d0c456f61f5'
		'745a621aa8d8a9f8ef6cd017da94e0103db9e8c3e749dcc8613139d1a57a2fe0')
install=$pkgname.install

package() {

  install -dm 755 $pkgdir/usr/share/fonts/{OTF,TTF}
  install -dm 755 $pkgdir/usr/share/licenses/fonts-ldco
  install -Dm 644 $srcdir/{1,2,3}Part/*/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 $srcdir/{1,2,3}Part/*/*.otf $pkgdir/usr/share/fonts/OTF
  
  firstpart=$(ls $srcdir | head -1)
  firstfont=$(ls $firstpart | head -1)
  install -Dm 644 $srcdir/$firstpart/$firstfont/{OFL.txt,ofl-faq.txt} $pkgdir/usr/share/licenses/fonts-ldco

}
