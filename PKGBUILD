# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=caffeine-ng-git
_pkgname=caffeine-ng
pkgver=3.4.2.post22+g4ec5e87
pkgrel=1
pkgdesc="Status bar application able to temporarily inhibit the screensaver and sleep mode."
arch=(any)
url="https://github.com/caffeine-ng/caffeine-ng"
license=(GPL3)
depends=(python-gobject python-xdg python-dbus python-docopt python-ewmh gtk3
         libnotify python-setproctitle python-wheel python-pulse-control)
optdepends=("libindicator-gtk3: AppIndictor support.")
makedepends=(git python-setuptools-scm)
conflicts=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
provides=(caffeine caffeine-bzr caffeine-oneclick caffeine-systray)
replaces=(caffeine-oneclick caffeine-systray)
source=("git+https://github.com/caffeine-ng/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  python setup.py --version
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir"
}
