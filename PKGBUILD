# Maintainer: steelstrings <steelstrings.of.a{at}gmail{dot}com>
# based on captiva-icons-git by tydell

pkgname=insignia-icon-theme-git
_pkgname=insignia
pkgver=68.2a1ef79
pkgrel=1
pkgdesc="Insignia Icon Theme by Francisco Villarroel"
arch=('any')
url="https://github.com/fsvh/insignia"
license=('GPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=('insignia-icon-theme-git')
conflicts=('insignia-icon-theme-git')
source=('git+https://github.com/fsvh/insignia.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/Insignia

  # install theme
  cd $srcdir/$_pkgname/Insignia
  cp -r . "$pkgdir"/usr/share/icons/Insignia/
}
