# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-account-faces-git
pkgver=1.0.12.r2.gde4f407
pkgrel=1
pkgdesc='Account faces for Linux Deepin'
arch=('any')
license=('GPL3')
url="https://github.com/linuxdeepin/dde-account-faces"
makedepends=('git')
conflicts=('dde-account-faces')
replaces=('dde-account-faces')
group=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-account-faces/")
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
