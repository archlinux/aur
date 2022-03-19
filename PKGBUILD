# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-gtk-theme-git
pkgver=2020.06.10.r15.g4025b51
pkgrel=1
pkgdesc="Deepin GTK Theme"
arch=('any')
url="https://github.com/linuxdeepin/deepin-gtk-theme"
makedepends=('git')
license=('LGPL3')
optdepends=('gtk-engine-murrine: for gtk2 themes')
groups=('deepin')
source=("$pkgname::git+https://github.com/linuxdeepin/deepin-gtk-theme/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd $pkgname
    if [[ ! -z ${sha} ]];then
      git checkout -b $sha
    fi
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
