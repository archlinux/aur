
pkgname=ttf-gujrati-fonts
pkgver=0.0
pkgrel=0
pkgdesc="Gujrati Fonts"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://gujarati.indiatyping.com"



source=(
"http://gujarati.indiatyping.com/images/downloadfonts/Gujrati/Avantika.zip"
"http://gujarati.indiatyping.com/images/downloadfonts/Gujrati/Gopika.zip"
"http://gujarati.indiatyping.com/images/downloadfonts/Gujrati/Shree768.zip"
)
md5sums=(
"914af5f7de2149a0c9ea5500149faa75"
"9d1a01da77cfd303fdd3f1093b20d42d"
"d1a8d85c268df98876182368d2d4d0af"
)

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/Avantika.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -m644 "$srcdir/Gopika.ttf" "$pkgdir/usr/share/fonts/TTF/"
  install -m644 "$srcdir/Shree768.ttf" "$pkgdir/usr/share/fonts/TTF/"

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
