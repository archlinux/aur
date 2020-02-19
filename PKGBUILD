# Maintainer: Jason Nader <jason.nader@protonmail.com>
pkgname=('autotiling-git')
_pkgname=autotiling
pkgver=r24.6854508
pkgrel=1
pkgdesc="Script for sway and i3 to automatically switch the horizontal / vertical window split orientation"
arch=('x86_64')
url="https://github.com/nwg-piotr/autotiling"
license=('GPL3')
depends=('python-i3ipc')
makedepends=('git')
source=("${pkgname%-*}::git+https://github.com/nwg-piotr/autotiling.git")
md5sums=('SKIP')
provides=("autotiling")
conflicts=("autotiling")

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -D -t "$pkgdir/usr/lib/$_pkgname" autotiling.py
  install -D -t "$pkgdir/usr/bin" autotiling
}

