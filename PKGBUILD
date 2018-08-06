# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=3.4.2
pkgrel=2
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://github.com/caffeine-ng/caffeine-ng"
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle python-setuptools python-wheel)
optdepends=("libappindicator-gtk3: AppIndictor support (eg: Plasma, Unity).")
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
source=("https://pypi.io/packages/source/c/${pkgname}/${pkgname}-${pkgver}.tar.gz")

md5sums=('e96496616c4341561e224989f4d1ee61')

build() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python setup.py install --root="$pkgdir"
}
