# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=('palenight-gtk-theme'
         'amarena-gtk-theme'
         'gruvterial-gtk-theme'
         'oceanic-gtk-theme'
         'spacx-gtk-theme')
pkgbase=gtk-theme-framework
pkgver=0.2.3
pkgrel=1
pkgdesc="GTK themes built with the GTK Theme Framework"
arch=('any')
url="https://github.com/jaxwilko/gtk-theme-framework"
license=('GPL-3.0-or-later')
depends=('gtk3')
makedepends=('git')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support')
conflicts=('material-gtk-framework')
replaces=('material-gtk-framework')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        'git+https://github.com/vinceliuice/vimix-icon-theme.git')
sha256sums=('03321d21359f303f05872db688e78698d3fc9c22e66190ecf0afd0fa57cb605d'
            'SKIP')

prepare() {
  cd "$pkgbase-$pkgver"
  if [[ ! -d src/icons/vimix-icon-theme ]]; then
    ln -s "$srcdir/vimix-icon-theme" src/icons/vimix-icon-theme
  fi
}

package_palenight-gtk-theme() {
  pkgdesc="Palenight GTK theme & icon set: built with the GTK Theme Framework"

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/share/{icons,themes}
  ./main.sh -v -id "$pkgdir/usr/share/themes" \
    -op "$pkgdir/usr/share/icons"
}

package_amarena-gtk-theme() {
  pkgdesc="Amarena GTK theme & icon set: built with the GTK Theme Framework"

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/share/{icons,themes}
  ./main.sh -t amarena -v -id "$pkgdir/usr/share/themes" \
    -op "$pkgdir/usr/share/icons"
}

package_gruvterial-gtk-theme() {
  pkgdesc="Gruvterial GTK theme & icon set: built with the GTK Theme Framework"

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/share/{icons,themes}
  ./main.sh -t gruvterial -v -id "$pkgdir/usr/share/themes" \
    -op "$pkgdir/usr/share/icons"
}

package_oceanic-gtk-theme() {
  pkgdesc="Oceanic GTK theme & icon set: built with the GTK Theme Framework"

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/share/{icons,themes}
  ./main.sh -t oceanic -v -id "$pkgdir/usr/share/themes" \
    -op "$pkgdir/usr/share/icons"
}

package_spacx-gtk-theme() {
  pkgdesc="Spacex GTK theme & icon set: built with the GTK Theme Framework"

  cd "$pkgbase-$pkgver"
  install -d "$pkgdir"/usr/share/{icons,themes}
  ./main.sh -t spacx -v -id "$pkgdir/usr/share/themes" \
    -op "$pkgdir/usr/share/icons"
}
