# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2021-08-23
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'qogir-icon-theme: Recommended icon theme'
            'kvantum-theme-matcha: Matching Kvantum theme')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$_pkgver.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/$_pkgver.tar.gz")
sha256sums=('2571fdc0ab8edae9ee8bda63578d74949dbc9cb48ab11f5fdbc8153d7a2f460b')

package() {
  cd "Matcha-gtk-theme-$_pkgver"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -d "$pkgdir/usr/share/themes"

  # Plank theme
  install -Dm644 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/Matcha"

  # Firefox & Gedit theme
  install -d "$pkgdir/usr/share/doc/$pkgname"
  cp -r src/extra/* "$pkgdir/usr/share/doc/$pkgname"
}
