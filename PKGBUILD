# Maintainer: Aleksana QwQ <me@aleksana.moe>

pkgname=nautilus-open-any-terminal-git
pkgver=0.3.0.r10.g7cdc4d0
pkgrel=1
pkgdesc="context-menu entry for opening other terminal in nautilus, git version"
arch=(any)
url="https://github.com/Stunkymonkey/nautilus-open-any-terminal"
license=(GPL3)
depends=(python-nautilus)
makedepends=(git python-setuptools)
provides=('nautilus-open-any-terminal')
conflicts=('nautilus-open-any-terminal')
_commit=4c15e8bd0d84550b61ead50b0d78a75f831df010
source=("$pkgname::git+$url")
sha512sums=("SKIP")

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $pkgname
  python3 setup.py build
}

package() {
  cd $pkgname
  python3 setup.py install --root="$pkgdir" --optimize=1
}

