# Maintainer: Andy Crowd andy_crowd@ainsdata.se 
pkgname=ttf-lao
pkgver=0.0
pkgrel=20060226
pkgdesc="Lao TTF fonts"
arch=(any)
depends=(fontconfig xorg-font-utils)
url="http://prdownloads.sourceforge.net/laofoss/Phetsarath_OT.zip"
license=('GPL-2.1 or late')
source=(http://prdownloads.sourceforge.net/laofoss/Phetsarath_OT.zip
)

md5sums=(2a8d37d7ea2d937b101226edda11200b)

package() {
install -d "$pkgdir/usr/share/fonts/TTF"
install -m644 "Phetsarath_OT.ttf" "$pkgdir/usr/share/fonts/TTF/"

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

