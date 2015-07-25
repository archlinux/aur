# Font authors:
#Saleumsak Khammungkhune(skhammun@gensia.com)
#Soupha Brice Muangkhot(Brice@ibm.fr)
#LAONET.
#laonet@tuddy.cc.monash.edu.au

pkgname=ttf-lao-fonts
pkgver=0.0
pkgrel=0
pkgdesc="Lao TTF fonts, Windows"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.clear-vu.com.hk/resources/lao_fonts.asp"
lcense=('Free to use. For commercial use contact the author.')
source=(
"http://www.clear-vu.com.hk/resources/downloads/saysettha_ot.ttf"
"http://www.clear-vu.com.hk/resources/downloads/laofonts.zip"
)

md5sums=(
"65b20f284c153f5ee6bfa12b198d0245"
"0f5a59c0e4c432f607770931f2957d0a"

)


package() {
   install -d "$pkgdir/usr/share/fonts/TTF"
   install -m644 "$srcdir/saysettha_ot.ttf" "$pkgdir/usr/share/fonts/TTF/"
   install -m644 "$srcdir/"*.TTF "$pkgdir/usr/share/fonts/TTF/"
}
 
post_install() {
  echo -n "Updating font cache... "
  fc-cache >/dev/null -f
  mkfontscale /usr/share/fonts/TTF
  mkfontdir   /usr/share/fonts/TTF
  echo done
}

post_upgrade() {
  post_install
}

post_remove() {
  post_install
}

