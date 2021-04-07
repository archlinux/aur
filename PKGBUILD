# Maintainer: Daniel Menelkir <menelkir at itroll dot org>

pkgname=python-virtkey
pkgver=0.63.0
pkgrel=1
pkgdesc="Extension for python and python3 to emulate keypresses and to get the layout information from the X server."
arch=('x86_64')
url="https://launchpad.net/virtkey"
license=('GPLv3')
depends=('python')
source=(https://launchpad.net/virtkey/0.63/${pkgver}/+download/virtkey-${pkgver}.tar.gz)
sha512sums=('14b57306dda164b200e68ab1435774346222236cb8b5c8ee4d46e4f92d048f30393e6a486549b4c31aa35f2c00c8b1c7774fd01958268db6b2f312a4caaf34f9')

build() {
  cd "${srcdir}/virtkey-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/virtkey-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
}
