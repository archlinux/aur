# Maintainer: Robert Booster <boosterdev at linuxmail dot org>

pkgname="zuki-themes"
_pkgver="v3.26-1"
pkgver="3.26.1"
pkgrel=1
pkgdesc="A selection of themes for GNOME, Xfce and more (includes Zukitwo and Zukitre)."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'ttf-roboto')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/$_pkgver.tar.gz")
sha256sums=('24234c98f3541bb1eafd321055b0b75d33989ef9d371c2e8ccb53f653fb30f76')

pkgver(){
  echo \"$(echo "$_pkgver" | sed 's/v//g;s/-/./g')\"
}

package(){
  install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
  cd $(find -maxdepth 1 -type d | grep '[a-z]')
  cp -rp Zuki* "$pkgdir"/usr/share/themes
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
