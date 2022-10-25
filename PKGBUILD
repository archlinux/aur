# Maintainer: EnderPi <samueltlewis27 at gmail.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>
pkgname=python-kivymd
pkgver=1.1.1
pkgrel=1
pkgdesc="KivyMD is a collection of Material Design compliant widgets for use with Kivy, a framework for cross-platform, touch-enabled graphical applications."
arch=('any')
url="https://github.com/kivymd/KivyMD/"
license=('MIT')
makedepends=('python-setuptools')
source=("https://github.com/kivymd/KivyMD/archive/${pkgver}.tar.gz")
md5sums=('ba3c7e9696ac850e1c054af55a7da3f7')

build() {
  cd "${srcdir}/KivyMD-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/KivyMD-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
