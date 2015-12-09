# Maintainer: willemw <willemw12@gmail.com>

_pkgname=dmenu-frecency
pkgname=$_pkgname-git
pkgver=r46.d98be08
pkgrel=1
pkgdesc="dmenu-based desktop application launcher that uses a combination of frequency and recency. Launches XDG desktop files and executables from PATH."
arch=('any')
url="https://github.com/kspi/dmenu-frecency"
license=('MIT')
depends=('dmenu' 'python-docopt' 'python-xdg')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
source=(git://github.com/kspi/$_pkgname.git)
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
}

