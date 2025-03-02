# Maintainer: EnderPi <samueltlewis27 at gmail.com>
# Contributor: lazant <a.l.i.c.e at outlook.com>
pkgname=python-kivymd
pkgver=1.2.0
pkgrel=1
pkgdesc="KivyMD is a collection of Material Design compliant widgets for use with Kivy, a framework for cross-platform, touch-enabled graphical applications."
arch=('any')
url="https://pypi.org/project/kivymd/"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/20/81/0b1154f5e581d5910702d9fadb3217f56cb186f72c8b36de0271e7ff9b5c/kivymd-${pkgver}.tar.gz")
md5sums=('1898379f722f5be9c2e5187cc9507853')

build() {
  cd "${srcdir}/kivymd-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/kivymd-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
