# Maintainer: steelstrings <steelstrings.of.a{at}gmail{dot}com>
# based on captiva-icons-git and adwaita-icon-theme-git and antu-icon-theme-git

pkgname=antu-classic-icon-theme-git
_pkgname=Antu-classic
pkgver=1.0.8.g90645fd
pkgrel=1
pkgdesc="Antü Classic Icon Theme by Fabián Alexis"
arch=('any')
url="https://gitlab.com/froodo_alexis/Antu-classic/"
license=('LGPL2.1')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.com/froodo_alexis/Antu-classic.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$_pkgname"
  git describe --long --tags| sed 's|-|.|g'
}

prepare() {
  cd "$srcdir"/"$_pkgname" && rm {LICENSE.md,README.md}
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons

  # install theme
  cd "$srcdir"/"$_pkgname"/
  cp -r . "$pkgdir"/usr/share/icons/
}
