# Maintainer: justforlxz <justforlxz@gmail.com>

pkgname=deepin-account-faces-git
pkgver=1.0.16.r0.g9f729c4
pkgrel=1
pkgdesc='Account faces for Linux Deepin'
arch=('any')
license=('GPL3')
url="https://github.com/linuxdeepin/dde-account-faces"
makedepends=('git')
conflicts=('deepin-account-faces')
provides=('deepin-account-faces')
group=('deepin-git')
source=("git+https://github.com/linuxdeepin/dde-account-faces/")
sha512sums=('SKIP')
install="$pkgname.install"

pkgver() {
    cd dde-account-faces
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd dde-account-faces
  make DESTDIR="$pkgdir" install
  chmod 775 "$pkgdir"/var/lib/AccountsService/icons
}
