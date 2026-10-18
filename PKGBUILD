# Maintainer: Trumpetrespas <email [at] trumptrespas [dot] com>

# PKGBUILD Based off of colloid-icon-theme-git by Mark Wagie <mark dot wagie at proton dot me>
pkgname=(
  'colloid-icon-theme'
  'colloid-catppuccin-theme'
  'colloid-dracula-theme'
  'colloid-everforest-theme'
  'colloid-gruvbox-theme'
  'colloid-nord-icon-theme'
  'colloid-cursors'
)
pkgbase=colloid-icon-theme
_pkgbase="${pkgbase/c/C}"
pkgver=2026.08.10
_pkgver="${pkgver//./-}"
pkgrel=1
pkgdesc="Icon theme for Linux desktops"
arch=('any')
url="https://github.com/vinceliuice/${_pkgbase}"
license=('GPL-3.0-or-later')
depends=('gtk-update-icon-cache' 'hicolor-icon-theme')
options=('!strip')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/vinceliuice/${_pkgbase}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('367c3ce3ab85721e41ca9aa4fccd1761ec236d1b8cd7daf65f5e9ec88c1a8a15')

prepare() {
  cd ${_pkgbase}-${_pkgver}

  # Disable running gtk-update-icon-cache
  sed -i '/gtk-update-icon-cache/d' install.sh
}

package_colloid-icon-theme() {

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s default -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-catppuccin-theme() {
  pkgdesc="Catppuccin icon theme for Linux desktops"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s catppuccin -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-dracula-theme() {
  pkgdesc="Dracula icon theme for Linux desktops"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s dracula -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-everforest-theme() {
  pkgdesc="Everforest icon theme for Linux desktops"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s everforest -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-gruvbox-theme() {
  pkgdesc="Gruvbox icon theme for Linux desktops"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s gruvbox -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-nord-icon-theme() {
  pkgdesc="Nord icon theme for Linux desktops"

  cd ${_pkgbase}-${_pkgver}
  install -d "$pkgdir/usr/share/icons"
  ./install.sh -s nord -t all -d "$pkgdir/usr/share/icons"
}

package_colloid-cursors() {
  pkgdesc="An x-cursor theme inspired by Colloid theme and based on capitaine-cursors"
  depends=()

  cd ${_pkgbase}-${_pkgver}/cursors
  install -d "$pkgdir"/usr/share/icons/Colloid{-cursors,-dark-cursors}
  cp -r dist/* "$pkgdir/usr/share/icons/Colloid-cursors/"
  cp -r dist-dark/* "$pkgdir/usr/share/icons/Colloid-dark-cursors/"
}
