# Maintainer: Francois Boulogne <fboulogne@april.org>

pkgname=python-pyinsane
pkgver=1.3.6
pkgrel=1
pkgdesc='Python implementation of the Sane API (using ctypes) and abstration layer'
arch=('any')
url='https://github.com/jflesch/pyinsane'
license=('GPL3')
depends=('libksane')
provides=('python-pyinsane')
conflicts=('python-pyinsane')
makedepends=('python' 'python-setuptools')
source=("https://github.com/jflesch/pyinsane/archive/v${pkgver}.zip")

build() {
  cd "pyinsane-${pkgver}"
  python setup.py build
}

package() {
  cd "pyinsane-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:ts=2:sw=2:et:
md5sums=('a532a050638b2bef762a741ff91904e0')
