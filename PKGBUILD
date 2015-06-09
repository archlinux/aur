# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=3.1
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url=https://github.com/hobarrera/caffeine-ng
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle)
optdepends=("libindicator-gtk3: AppIndictor support.")
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
install=$pkgname.install
source=("$pkgver.tar.gz::https://git.barrera.io/hobarrera/$pkgname/repository/archive.tar.gz?ref=v$pkgver")
sha256sums=('08f1034895013d99e31ede006543eabeace368378e36a9be4b27b51a3fd80fc0')

build() {
  cd $pkgname.git
  python setup.py build
}

package() {
  cd $pkgname.git
  python setup.py install --root="$pkgdir"
}
