# Maintainer: Trumpetrespas < email [at] trumpetrespas [dot] com

# based on colloid-gtk-theme-git by Mark Wagie <mark dot wagie at proton dot me>

pkgname=(
  'colloid-gtk-theme'
  'colloid-catppuccin-gtk-theme'
  'colloid-dracula-gtk-theme'
  'colloid-everforest-gtk-theme'
  'colloid-gruvbox-gtk-theme'
  'colloid-nord-gtk-theme'
)
pkgbase=colloid-gtk-theme
pkgver=2026.08.08
pkgrel=1

_pkgbase="${pkgbase/c/C}"
_pkgver="${pkgver//./-}"

pkgdesc="Gtk theme for Linux"

arch=('any')

url="https://github.com/vinceliuice/${_pkgbase}"

license=('GPL-3.0-or-later')
makedepends=(
  'sassc'
)
optdepends=(
  'colloid-cursors: Matching cursor theme'
  'colloid-icon-theme: Matching icon theme'
  'gtk-engine-murrine: GTK2 theme support'
)
options=('!strip')
install="${pkgbase%}.install"

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vinceliuice/${_pkgbase}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('SKIP')


prepare() {
  cd ${_pkgbase}-${_pkgver}

  # Don't call clean_theme function
  sed -i 's/clean_theme && install_theme/install_theme/g' install.sh
}

package_colloid-gtk-theme() {
  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact -d "$pkgdir/usr/share/themes"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname}"
  cp -r src/other/firefox "$pkgdir/usr/share/doc/${pkgname}/"
}

package_colloid-catppuccin-gtk-theme() {
  pkgdesc="Gtk Catppuccin theme for Linux"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks catppuccin -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks catppuccin -d "$pkgdir/usr/share/themes"
}

package_colloid-dracula-gtk-theme() {
  pkgdesc="Gtk Dracula theme for Linux"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks dracula -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks dracula -d "$pkgdir/usr/share/themes"
}

package_colloid-everforest-gtk-theme() {
  pkgdesc="Gtk Everforest theme for Linux"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks everforest -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks everforest -d "$pkgdir/usr/share/themes"
}

package_colloid-gruvbox-gtk-theme() {
  pkgdesc="Gtk Gruvbox theme for Linux"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks gruvbox -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks gruvbox -d "$pkgdir/usr/share/themes"
}

package_colloid-nord-gtk-theme() {
  pkgdesc="Gtk Nord theme for Linux"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks nord -d "$pkgdir/usr/share/themes"
}
