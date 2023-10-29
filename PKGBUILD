# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Jack Random <jack ät random.to>
# Contributor: Michael J. Pento <mjpento@verizon.net>
# Contributor: grimi <grimi at poczta dot fm>
pkgname=matcha-gtk-theme
_pkgver=2023-10-30
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="A flat design theme for GTK 3, GTK 2 and GNOME Shell"
arch=('any')
url="https://vinceliuice.github.io/theme-matcha.html"
license=('GPL3')
optdepends=('gtk-engine-murrine: GTK2 theme support'
            'gtk-engines: GTK2 theme support'
            'qogir-icon-theme: Recommended icon theme')
options=('!strip')
install="$pkgname.install"
source=("$pkgname-${_pkgver}.tar.gz::https://github.com/vinceliuice/Matcha-gtk-theme/archive/${_pkgver}.tar.gz")
sha256sums=('9e7c1b7055bd996eaa01e8cd30e098dc1873f98690d2ace6ecad0e945307d470')

package() {
  cd "Matcha-gtk-theme-${_pkgver}"
  install -d "$pkgdir/usr/share/themes"
  ./install.sh -d "$pkgdir/usr/share/themes/"

  # Install script fails to honor dest DIR for GTKSV_DIR, install files manually
  install -Dm644 src/extra/gtksourceview/*.xml -t \
    "$pkgdir/usr/share/gtksourceview-3.0/styles/"
}
