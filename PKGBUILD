# Maintainer: Diego <cdprincipe atgmaildot com>

pkgname=xfce-theme-albatross-git
pkgver=1.7.3_5_g735e8f2
pkgrel=1
pkgdesc="A dark, smooth Xfce theme, introduced in the release of Xubuntu 9.10"
arch=('any')
url="https://github.com/shimmerproject/Albatross"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('xfce-theme-albatross')
conflicts=('xfce-theme-albatross')
source=('git+http://github.com/shimmerproject/Albatross')
md5sums=('SKIP')

pkgver() {
  cd Albatross
  git describe --always | sed 's#-#_#g;s#v##'
}

package() {
  cd Albatross

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/Albatross{,-compact/xfwm4}

  # clean up
  rm -rf {.git,.gitignore,LICENSE.{CC,GPL},README}

  # install theme
  cp -r . "$pkgdir"/usr/share/themes/Albatross/

}
