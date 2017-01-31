# Maintainer: mastercoms <circuitsoft@tuta.io>

pkgname=vineyard-git
pkgver=90.fe542ae
pkgrel=1
pkgdesc="Windows programs on Linux, easily (git version)"
arch=('any')
url="http://vineyardproject.org/"
license=('LGPL2')
provides=('vineyard' 'python2-wine')
conflicts=('vineyard' 'python2-wine')
depends=('wine' 'python2-dbus' 'python2-libappindicator' 'python2-gobject2' 'unzip' 'python2' 'icoutils' 'cabextract')
optdepends=('winetricks: install software and dependencies')
makedepends=('git')
source=('git+https://github.com/Cybolic/vineyard.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/vineyard"

  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/vineyard"

  python2 setup.py build
}

package() {
  cd "${srcdir}/vineyard"

  python2 setup.py install --root "${pkgdir}"
}

