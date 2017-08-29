# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname='python-pygorithm'
_name=pygorithm
pkgver=1.0.3
pkgrel=1
pkgdesc='A Python module for learning all major algorithms'
url='https://github.com/OmkarPathak/pygorithm'
arch=('any')
license=('MIT')
depends=('python')
provides=("${_name}=${pkgver}")
source=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('39d85e07c20168e46df85ad0cbcdfb390a6274f7e0fa8f9955ddee65558b22aa')

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
