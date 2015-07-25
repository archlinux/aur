pkgname=ttf-gurmukhi_punjabi
pkgver=0.0
pkgrel=0
pkgdesc="Gurmukhi/ Punjabi - 252 fonts"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.billie.grosse.is-a-geek.com"

source=(
"http://www.billie.grosse.is-a-geek.com/res/local/allbillie.tar.bz2"
)

md5sums=(
"15b7f0ad720eeb0e62da344978305229"
)

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
