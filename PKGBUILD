# Maintainer: steelstrings <steelstring.of.a{at}gmail{dot}com>

pkgname=el-general-icon-theme-git
_pkgname=El-General
pkgver=14.4d410d6
pkgrel=1
pkgdesc="El General Icon Theme by Fabián Alexis"
arch=('any')
url="https://github.com/Mikail70/El-General"
license=('LGPL3')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=('el-general-icon-theme-git')
conflicts=('el-general-icon-theme-git')
source=('git+https://github.com/Mikail70/El-General')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {

  # create icon theme dir
  install -d -m 755 "$pkgdir"/usr/share/icons/$_pkgname

  # install icon theme
  cd $srcdir/$_pkgname/El\ General
  cp -dr --no-preserve='ownership' ./ "$pkgdir"/usr/share/icons/$_pkgname
}
