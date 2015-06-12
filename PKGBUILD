# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: varlesh <https://launchpad.net/~varlesh-l>

pkgname=elementary-add-icon-theme-git
_pkgname=elementary-add
pkgver=205.d1b5acd
pkgrel=1
pkgdesc='Additional icons for elementary OS Freya.'
arch=('any')
url='https://github.com/varlesh/elementary-add'
license=('GPL3')
depends=('elementary-icon-theme-bzr')
optdepends=()
makedepends=('git')
provides=("${pkgname%}")
conflicts=("${pkgname%}")
install="${pkgname%-*}.install"
source=('git+https://github.com/varlesh/elementary-add.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/icons/elementary-add

  # install theme
  cd $srcdir/elementary-add/elementary-add
  cp -r . "$pkgdir"/usr/share/icons/elementary-add/
}
