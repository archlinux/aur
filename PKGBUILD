# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=3.2
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
sha256sums=('b48b51a6ac2d1141592f0af68028d6110ef082a36d4e86ec00130b8be44d427e')

build() {
  cd "$srcdir"/caffeine-ng-v${pkgver}-*
  python setup.py build
}

package() {
  cd "$srcdir"/caffeine-ng-v${pkgver}-*
  python setup.py install --root="$pkgdir"
}
