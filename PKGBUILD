# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=('python-mediafire-git')
_module=mediafire
pkgver=r121.e68913f
pkgrel=1
pkgdesc="Python MediaFire client library (git)"
url="https://github.com/MediaFire/mediafire-python-open-sdk"
license=('BSD')
arch=('any')
# source=("mediafire"::"git+https://github.com/MediaFire/mediafire-python-open-sdk")
source=("mediafire"::"git+https://github.com/szlaci83/mediafire-python-open-sdk#branch=v1.5_api")
makedepends=('python-setuptools' 'git')
depends=('python' 'python-requests-toolbelt')
conflicts=('python-mediafire')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_module}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
