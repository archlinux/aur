# Maintainer Network Jack <Network_Jack@null.net>

pkgname=gtk-theme-windows-7
_pkgname=Windows-7
pkgver=2.1
pkgrel=1
pkgdesc="Linux theme based on the apperance of Windows 7"
arch=('any')
url="https://github.com/B00merang-Project/Windows-7"
license=('GPLv3')
optdepends=('gnome-themes-extra: for the GTK3 theme?'
            'gtk-engine-murrine: for the GTK2 theme')
#changelog=${pkgname}.changelog
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/B00merang-Project/Windows-7/archive/${pkgver}.tar.gz")
sha256sums=('ca073badebc16d7539f40f9e63f12b0998735e5503dfccb16d6a54323c819e5a')

package() {
  cd ${_pkgname}-$pkgver

  # create theme dir
  install -dm755 "$pkgdir/usr/share/themes/${_pkgname}"

  # install theme
  find . -type f -exec \
  install -Dm644 '{}' "$pkgdir/usr/share/themes/${_pkgname}/{}" \;
}
