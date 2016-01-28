# Maintainer: Quint Guvernator <quint@guvernator.net>
pkgname=arms-git # '-bzr', '-git', '-hg' or '-svn'
pkgver=1.1.0.r4.3a927e7
pkgrel=1
pkgdesc="ARMS: The Arch Regular Maintenance Script"
arch=('any')
url="https://github.com/qguv/arms"
license=('GPL')
depends=('sudo' 'less')
makedepends=('git')
optdepends=('reflector: to automatically update the mirrorlist')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('arms::git+https://github.com/qguv/arms')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/v//')"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D arms "$pkgdir/usr/bin/arms"
}
