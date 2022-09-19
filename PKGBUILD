# Contributor: lazant <a.l.i.c.e at outlook.com>
# Maintainer: EnderPi <samueltlewis27 at gmail.com>
pkgname=python-kivymd
pkgver=1.0.2
pkgrel=1
pkgdesc="KivyMD is a collection of Material Design compliant widgets for use with Kivy, a framework for cross-platform, touch-enabled graphical applications."
arch=('any')
url="https://github.com/HeaTTheatR/KivyMD/"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/HeaTTheatR/KivyMD/archive/${pkgver}.tar.gz")
md5sums=('2cefeec5df7fc81886cade8aca640c93')

build() {
  cd "${srcdir}/KivyMD-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/KivyMD-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
