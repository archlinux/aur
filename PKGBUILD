pkgname=ttf-gurmukhi-fonts_sikhnet
pkgver=0.0
pkgrel=0
pkgdesc="Gurmukhi Fonts"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://www.sikhnet.com"



source=(
#"http://fateh.sikhnet.com//sikhnet/register.nsf/6f000b70505976458725743400619f7b/bfece158fb98b70a8725668e006541a2/$FILE/GurbaniAkhar.zip"
"http://www.sikhnet.com/files/fonts/gurbaniwebthick.ttf"
"http://www.sikhnet.com/files/fonts/Prabhki.ttf"
)

md5sums=(
#"128a4dc024b39a4f29302bff6ef2d352"
"364f2873b97ac44b26daae58f2b73c2c"
"33d2c281c74ccde310529d6c81c273af"
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
