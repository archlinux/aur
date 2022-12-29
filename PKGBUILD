# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-account-faces-git
pkgver=1.0.12.1.r18.g9a65eb8
pkgrel=1
pkgdesc='Account faces for Linux Deepin'
arch=('any')
license=('GPL3')
url="https://github.com/linuxdeepin/dde-account-faces"
makedepends=('git')
conflicts=('deepin-account-faces')
provides=('deepin-account-faces')
group=('deepin-git')
source=("$pkgname::git+https://github.com/linuxdeepin/dde-account-faces/")
sha512sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
