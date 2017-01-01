# Maintainer: Amiad Bareli <amiad@hatul.info>

pkgname=fonts-ldco
name=LDCOFonts
filename=$name.tar.gz
pkgver="20161225"
pkgrel=2
pkgdesc="set of Hebrew fonts by Louis Davis and Co. in OTF and TTF formats."
arch=('any')
url="http://www.ldcodesign.com/%D7%98%D7%99%D7%A4%D7%95%D7%92%D7%A8%D7%A4%D7%99%D7%94/"
license=('OFL')
depends=(fontconfig xorg-fonts-encodings xorg-mkfontscale xorg-mkfontdir)

source=("http://ldcodesign.com/downloads/typography/$filename" $pkgname.install)
sha256sums=('be7d909223cb1cca7a377ee6424858fc3f75d20575777983176c0ee6a931120e'
		'745a621aa8d8a9f8ef6cd017da94e0103db9e8c3e749dcc8613139d1a57a2fe0')
install=$pkgname.install

package() {

  install -dm 755 $pkgdir/usr/share/fonts/{OTF,TTF}
  install -dm 755 $pkgdir/usr/share/licenses/fonts-ldco
  install -Dm 644 $srcdir/{1,2,3}Part/*/*.ttf $pkgdir/usr/share/fonts/TTF
  install -Dm 644 $srcdir/{1,2,3}Part/*/*.otf $pkgdir/usr/share/fonts/OTF
  
  firstfont=$(ls $srcdir/$name | head -1)
  install -Dm 644 $srcdir/$name/$firstfont/{OFL.txt,ofl-faq.txt} $pkgdir/usr/share/licenses/$pkgname

}
