pkgname=ttf-kannada-font
pkgver=0.0
pkgrel=0
pkgdesc="Kannada Font"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://kannada.indiatyping.com"

source=(
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BARAHA_Kannad.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHKANNW.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHMUSIC.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/BRHVEDIC.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/KAILASAM.zip"
"http://kannada.indiatyping.com/images/downloadfonts/Kannada/UMA_Kannada.zip"
"http://kannada.indiatyping.com/images/downloadfonts/akshar.zip"
)

md5sums=('6719857f9109b9b5fe4d7e9e64817325'
         'd5fd19dbddd3907e1fb049ab09ab31e1'
         'ed61f8a3862514d5f65cd4e0a506d4c3'
         '526ffc8d1f98fb7b29de562e6afb0c90'
         'db9a64eaa3f4b48aa0860cd29d112c19'
         'f9f3e4cd88b9c63af9d7d17acd2c3906'
         'be623cbc7218dff9f005128ad485c53c')

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.ttf "$pkgdir/usr/share/fonts/TTF/"
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
