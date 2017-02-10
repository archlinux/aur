# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng
pkgver=3.3.12
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://gitlab.com/hobarrera/caffeine-ng"
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle python-setuptools python-wheel)
optdepends=("libappindicator-gtk3: AppIndictor support (eg: Plasma, Unity).")
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
options=(!emptydirs !libtool)
install=$pkgname.install
source=("https://pypi.io/packages/source/c/${pkgname}/${pkgname}-${pkgver}.tar.gz")

md5sums=('054ad5cfd815ee2aac720ec5fed1ea7a')

build() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python setup.py build
}

package() {
  cd "$srcdir"/caffeine-ng-${pkgver}
  python setup.py install --root="$pkgdir"
}
