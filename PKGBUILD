# Maintainer: Jan Fader <jan.fader@web.de>

pkgname=python3-sensors-git
pkgver=r49.ef46fc8
_pkgname=pysensors
pkgrel=1
pkgdesc='Python bindings to libsensors'
arch=('any')
url='http://pypi.python.org/pypi/PySensors/'
license=('GPL')
depends=('python3' 'lm_sensors')
makedepends=('git')
source=(git+https://github.com/bastienleonard/pysensors.git#commit=ef46fc8eb181ecb8ad09b3d80bc002d23d9e26b3)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  python3 setup.py build
}

package() {
  cd "$srcdir/$_pkgname"

  python3 setup.py install -O1 --prefix='/usr' --root="$pkgdir"
}

# vim:set ts=2 sw=2 et:
