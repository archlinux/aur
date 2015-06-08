# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=ttf-tiresias
pkgver=20081220
pkgrel=4
pkgdesc="A set of free Sans Serif TrueType fonts"
arch=('any')
url="http://www.tiresias.org/fonts/fonts_download.htm"
license=('GPL3')
depends=('fontconfig' 'xorg-font-utils')
install=ttf.install
source=(http://www.tiresias.org/fonts/infofont.zip 
  http://www.tiresias.org/fonts/keyfont.zip 
  http://www.tiresias.org/fonts/lpfont.zip 
  http://www.tiresias.org/fonts/pcfont.zip 
  http://www.tiresias.org/fonts/signfont.zip)
md5sums=('7b076d700ff7b59a3881d8881db4fab7'
         'fde90f52e8601a520e4e5a614604d2f2'
         'df93252d02952e8b6a4af0d45f9d7244'
         'b6bec1c6a345090dc4845bb057b25f61'
         '9c5df5af4f04abb0a26be1b5c732c6c7')

prepare() {
  for _x in *.TTF
  do
    cp "${_x}" "`basename "$x" .TTF `.ttf" 
  done 
}

package() {
  install -d $pkgdir/usr/share/fonts/TTF 
  install -m644 *.ttf $pkgdir/usr/share/fonts/TTF/ 
}
