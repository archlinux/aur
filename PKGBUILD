# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'colloid-icon-theme-git'
  'colloid-catppuccin-theme-git'
  'colloid-dracula-theme-git'
  'colloid-everforest-theme-git'
  'colloid-gruvbox-theme-git'
  'colloid-nord-icon-theme-git'
  'colloid-cursors-git'
)
pkgbase=colloid-icon-theme-git
pkgver=2025.02.09.r0.g91901c7
pkgrel=1
pkgdesc="Icon theme for Linux desktops"
arch=('any')
url="https://github.com/vinceliuice/Colloid-icon-theme"
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
makedepends=('git')
options=('!strip')
source=('git+https://github.com/vinceliuice/Colloid-icon-theme.git')
sha256sums=('SKIP')

pkgver() {
  cd Colloid-icon-theme
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd Colloid-icon-theme

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package_colloid-icon-theme-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s default -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-catppuccin-theme-git() {
  pkgdesc="Catppuccin icon theme for Linux desktops"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s catppuccin -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-dracula-theme-git() {
  pkgdesc="Dracula icon theme for Linux desktops"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s dracula -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-everforest-theme-git() {
  pkgdesc="Everforest icon theme for Linux desktops"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s everforest -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-gruvbox-theme-git() {
  pkgdesc="Gruvbox icon theme for Linux desktops"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s gruvbox -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-nord-icon-theme-git() {
  pkgdesc="Nord icon theme for Linux desktops"
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s nord -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-cursors-git() {
  pkgdesc="An x-cursor theme inspired by Colloid theme and based on capitaine-cursors"
  depends=()
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd Colloid-icon-theme/cursors
  install -d "$pkgdir"/usr/share/icons/Colloid{-cursors,-dark-cursors}
  cp -r dist/* "$pkgdir/usr/share/icons/Colloid-cursors/"
  cp -r dist-dark/* "$pkgdir/usr/share/icons/Colloid-dark-cursors/"
}
