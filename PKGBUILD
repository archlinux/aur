# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=vimix-gtk-themes
_pkgver=2023-01-25
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat Material Design theme for GTK 3, GTK 2, GNOME Shell, etc."
arch=('any')
url="https://vinceliuice.github.io/theme-vimix.html"
license=('GPL3')
depends=('gtk3')
makedepends=('sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'kvantum-theme-vimix: Matching Kvantum theme'
            'vimix-icon-theme: Matching icon theme'
            'vimix-cursors: Matching cursor theme'
            'plank: for Plank theme')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/vinceliuice/$pkgname/archive/$_pkgver.tar.gz")
sha256sums=('9c2278c1b510b5466f44d852fa8ac313b884dd2284bb024d1b34897bbbc43522')

package() {
  cd "$pkgname-$_pkgver"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s all -d "$pkgdir/usr/share/themes"

  # Plank theme
  install -Dm644 src/plank/dock.theme -t "$pkgdir/usr/share/plank/themes/vimix"
}
