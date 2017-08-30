# Maintainer: Robert Booster <boosterdev at linuxmail dot org>

pkgname="zuki-themes"
_pkgver="v3.24-2"
pkgver="3.24.2"
pkgrel=1
pkgdesc="A selection of themes for GNOME, Xfce and more (includes Zukitwo and Zukitre)."
arch=('any')
url="https://github.com/lassekongo83/zuki-themes"
license=('GPL3')
depends=('gtk-engine-murrine' 'gtk-engines' 'ttf-roboto')
source=("$pkgname-$_pkgver.tar.gz::https://github.com/lassekongo83/zuki-themes/archive/$_pkgver.tar.gz")
sha256sums=('fade44b7ebee6ccfcc474b71e88b110f07b95a147c961146cc7d901f5de0aeb1')

pkgver(){
  echo \"$(echo "$_pkgver" | sed 's/v//g;s/-/./g')\"
}

package(){
  install -d -m755 "$pkgdir"/usr/share/{themes,licenses/$pkgname}
  cd $(find -maxdepth 1 -type d | grep '[a-z]')
  cp -rp Zuki* "$pkgdir"/usr/share/themes
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/
}
