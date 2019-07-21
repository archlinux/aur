# Maintainer: Jeinzi <jeinzi at gmx dot de>

pkgname='helpers-for-i3-git'
pkgver=r2.b8681d3
pkgrel=1
pkgdesc="Handy scripts for i3 window manager: smart resize/open new workspace."
arch=('any')
url="https://github.com/vivien/helpers-for-i3.git"
license=('GPL3')
depends=('i3-wm' 'python-i3ipc')
makedepends=('git')
source=("$pkgname::git+https://github.com/vivien/helpers-for-i3#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dv -t "$pkgdir/usr/bin/" "$srcdir/$pkgname/"{i3-new-workspace,i3-smart-resize}
}
