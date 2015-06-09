# Maintainer: sudokode <sudokode@gmail.com>

pkgname=seat-inspect-git
pkgver=1.0.r44.553faad
pkgrel=1
pkgdesc="Displays information about seats for users of logind"
arch=('any')
url="https://github.com/spanezz/seat-inspect"
license=('GPL3')
depends=('python' 'python-dbus')
makedepends=('git')
provides=('seat-inspect')
conflicts=('seat-inspect')
source=("$pkgname::git+https://github.com/spanezz/seat-inspect")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname

  printf "%s.r%s.%s\n" "$(git describe)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $pkgname

  install -Dm755 seat-inspect "$pkgdir/usr/bin/seat-inspect"
}

# vim:set ts=2 sw=2 et:
