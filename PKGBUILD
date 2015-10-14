# Maintainer: Ian Glen <ian@ianglen.me> 

pkgname=elementary-plus-icon-theme-git
_pkgname=elementaryPlus
pkgver=548.1100f81
pkgrel=1
pkgdesc="An addition to elementary OS's icon theme."
arch=('any')
url='https://github.com/mank319/elementaryPlus'
license=('GPL3')
depends=('elementary-icon-theme')
optdepends=()
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname}.install"
source=('git+https://github.com/mank319/elementaryPlus.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/elementary-plus

  # install theme
  cd $srcdir/$_pkgname/elementaryPlus
  cp -r . "$pkgdir"/usr/share/icons/elementary-plus/
}
