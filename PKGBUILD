# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'colloid-gtk-theme-git'
  'colloid-dracula-gtk-theme-git'
  'colloid-everforest-gtk-theme-git'
  'colloid-gruvbox-gtk-theme-git'
  'colloid-nord-gtk-theme-git'
)
pkgbase=colloid-gtk-theme-git
pkgver=2023.10.28.r18.g2949b6a7
pkgrel=1
pkgdesc="Gtk theme for Linux"
arch=('any')
url="https://github.com/vinceliuice/Colloid-gtk-theme"
license=('GPL-3.0-or-later')
makedepends=('git' 'sassc')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'colloid-icon-theme: Matching icon theme'
            'colloid-cursors: Matching cursor theme')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!strip')
install="${pkgname%-git}.install"
source=('git+https://github.com/vinceliuice/Colloid-gtk-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Colloid-gtk-theme
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package_colloid-gtk-theme-git() {
  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks normal -d "$pkgdir/usr/share/themes"

  # Firefox theme
  install -d "$pkgdir/usr/share/doc/${pkgname%-git}"
  cp -r src/other/firefox "$pkgdir/usr/share/doc/${pkgname%-git}/"
}

package_colloid-dracula-gtk-theme-git() {
  pkgdesc="Gtk Dracula theme for Linux"

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks dracula -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks dracula normal -d "$pkgdir/usr/share/themes"
}

package_colloid-everforest-gtk-theme-git() {
  pkgdesc="Gtk Everforest theme for Linux"

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks everforest -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks everforest normal -d "$pkgdir/usr/share/themes"
}

package_colloid-gruvbox-gtk-theme-git() {
  pkgdesc="Gtk Gruvbox theme for Linux"

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks gruvbox -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks gruvbox normal -d "$pkgdir/usr/share/themes"
}

package_colloid-nord-gtk-theme-git() {
  pkgdesc="Gtk Nord theme for Linux"

  cd Colloid-gtk-theme
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -t all --tweaks nord -d "$pkgdir/usr/share/themes"
  ./install.sh -t all -s compact --tweaks nord normal -d "$pkgdir/usr/share/themes"
}
