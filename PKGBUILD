# Maintainer: Diego <cdprincipe@at@gmail@dot@com>

_themename=Bluebird
pkgname=xfce-theme-bluebird-git
pkgver=1.2_7_g11053fd
pkgrel=1
pkgdesc="A light blue Xfce theme, introduced in the release of Xubuntu 10.10"
arch=('any')
url="https://github.com/shimmerproject/Bluebird"
license=('GPL2' 'CCPL')
depends=('gtk-engine-murrine')
makedepends=('git')
provides=('xfce-theme-bluebird')
conflicts=('xfce-theme-bluebird')
source=("git+http://github.com/shimmerproject/Bluebird")
md5sums=('SKIP')

pkgver() {
  cd $_themename
  git describe --always | sed 's#-#_#g;s#v##'
}

package() {
  cd "$srcdir/$_themename"

  # create theme dirs
  install -d -m 755 "$pkgdir"/usr/share/themes/$_themename

  # clean up
  rm -rf {.git,.gitignore,CREDITS,LICENSE,README}

  # install theme
  cp -r . "$pkgdir"/usr/share/themes/$_themename/
}
