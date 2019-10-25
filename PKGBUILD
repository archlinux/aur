# Maintainer: David Runge <dave@sleepmap.de>
_name=langdetect
pkgname=python-langdetect
pkgver=1.0.7
pkgrel=4
pkgdesc="Language detection library ported from Google's language-detection"
arch=('any')
url="https://github.com/Mimino666/langdetect"
license=('Apache')
depends=('python-six')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/l/${_name}/${_name}-${pkgver}.zip")
sha512sums=('7740bc8e5ea581bed69de9744a934f3e9c72910175933acb266bf25b0cb8797da6041b3d35e7c5d622a037b4c9e3d264828c2ba31bd2866fa7c36cf189e4767a')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package_python-langdetect() {
  cd "${_name}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
