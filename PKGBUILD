# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2025-04-11
pkgver=${_pkgver//-/.}
pkgrel=2
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL-3.0-or-later')
makedepends=('setconf')
optdepends=(
  'gtk-engine-murrine: GTK2 theme support'
  'gtk-engines: GTK2 theme support'
  'qogir-icon-theme: Recommended icon theme'
)
options=('!strip')
install="$pkgname.install"
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/${_pkgver}.tar.gz")
sha256sums=('8a3f71a3b9fd4907b28686e228e337d27742018e6dfa8e338326fe77115f5ea7')

prepare() {
  cd "Matcha-gtk-theme-${_pkgver}"

  # Set GTKSV_DIR to $pkgdir
  setconf install.sh GTKSV_DIR "$pkgdir/usr/share/gtksourceview-3.0/styles"
}

package() {
  cd "Matcha-gtk-theme-${_pkgver}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -d "$pkgdir/usr/share/themes/"
}
