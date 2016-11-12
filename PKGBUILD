# Maintainer: mastercoms <circuitsoft@tuta.io>

pkgname=vineyard-git
pkgver=88.a685ec9
pkgrel=1
pkgdesc="Windows programs on Linux, easily (git version)"
arch=('any')
url="http://vineyardproject.org/"
license=('LGPL2')
provides=('vineyard' 'python2-wine')
conflicts=('vineyard' 'python2-wine')
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

