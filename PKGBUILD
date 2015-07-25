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
"31812c559691117d0d67da104bb8a16e"
"07e02608f86c58adbe4faca233ab6e31"
"db771843a551dea704ebf15b71341c78"
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
