# Maintainer: cilgin <cilgincc@outlook.com>

# shellcheck disable=SC2034,SC2154,SC2128,SC2164

pkgname=nautilus-open-any-terminal-git
pkgver=0.8.1.r60.g32135a4
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus, git version"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(git python-setuptools)
provides=('nautilus-open-any-terminal')
conflicts=('nautilus-open-any-terminal')
source=("$pkgname::git+$url")
sha512sums=("SKIP")
install=nautilus-open-any-terminal.install

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  make build
}

package() {
  cd "$pkgname"
  make DESTDIR="${pkgdir}" PREFIX="/usr" install
}
