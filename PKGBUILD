# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname='python-pygorithm'
_name=pygorithm
pkgver=1.0
pkgrel=1
pkgdesc='A Python module for learning all major algorithms'
url='https://github.com/OmkarPathak/pygorithm'
arch=('any')
license=('MIT')
depends=('python')
provides=("${_name}=${pkgver}")
source=("${url}/releases/download/v${pkgver}.0/${_name}-${pkgver}.tar.gz")
sha256sums=('064ea5fe7a9440dbefbd45a1b486b97863ea19036d47809098bf20118943fbc3')

# Enable for tests
check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m unittest
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ft=sh ts=2 sw=2 et:
