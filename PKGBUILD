# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=caffeine-bzr
pkgver=r670
pkgrel=1
pkgdesc="A easy way to control powersaving on your desktop."
arch=(any)
url="https://launchpad.net/caffeine"
license=(GPL3)
depends=(python-gobject python-ewmh libappindicator-gtk3)
makedepends=(bzr)
conflicts=(caffeine caffeine-ng caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-ng caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
source=("$pkgname::bzr+https://code.launchpad.net/~caffeine-developers/caffeine/main")

md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/"$pkgname"
  printf "r%s" "$(bzr revno)"
}

build() {
  cd "$srcdir"/"$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir"/"$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
