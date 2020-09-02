 # Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=python-omgifol
pkgver=0.4.0
pkgrel=1
pkgdesc="A Python library for manipulating Doom WAD files"

url='https://github.com/devinacker/omgifol'
arch=('any')
license=('MIT')
depends=('python')
makedepends=('python-setuptools')

source=("https://github.com/devinacker/omgifol/archive/${pkgver}.tar.gz")

sha256sums=('4d19e1d4d11e4a9db6f9a939ad0845b804caa617c42d43cfafefeb9f6be557a2')

pkgver() {
  cd omgifol
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/omgifol-${pkgver}"
  python ./setup.py install --root="${pkgdir}" --prefix=/usr --optimize=1
}
