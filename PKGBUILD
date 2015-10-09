# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=3.1
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://gitlab.com/hobarrera/caffeine-ng"
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle)
optdepends=("libindicator-gtk3: AppIndictor support.")
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
install=$pkgname.install
source=("$pkgver.tar.gz::https://gitlab.com/hobarrera/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('23c10f0381225ae13fd7efb5cd29a7d852dc52214650bee4cbc18032a46b3af4')

build() {
  cd "$srcdir"/caffeine-ng-v3.1-*
  python setup.py build
}

package() {
  cd "$srcdir"/caffeine-ng-v3.1-*
  python setup.py install --root="$pkgdir"
}
