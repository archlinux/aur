# Maintainer: Stephen Smith <stephen304@gmail.com>

pkgname=caffeine
pkgver=2.6.2
pkgrel=1
pkgdesc="A easy way to control powersaving on your desktop."
arch=(any)
url="https://launchpad.net/caffeine"
license=(GPL3)
depends=(python-gobject python-ewmh)
conflicts=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
provides=(caffeine-bzr caffeine-ng caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
source=("https://launchpad.net/caffeine/2.6/2.6/+download/caffeine_2.6.2.tar.gz")

md5sums=('91d254a124d83f266470c2118592425d')

build() {
  cd "$srcdir"/"$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir"/"$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}
