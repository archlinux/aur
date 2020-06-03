# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: mober <maxATmoberDOTat>

_pkgname=activityfox
pkgname=$_pkgname-git
pkgver=0.2.r3.g2c84c52
pkgrel=1
pkgdesc="allow Firefox to play nice with KDE Plasma Activities"
arch=('i686' 'x86_64')
url="https://github.com/temporaryname96/activityfox"
license=('GPL3')
depends=('firefox')
makedepends=('automoc4')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  cmake .
  make
}

package() {
  cd "$srcdir/$_pkgname"
  install -D -t ${pkgdir}/usr/bin activityfox activityfox.shell
}
