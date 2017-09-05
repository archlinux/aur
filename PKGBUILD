# Maintainer: Javier Tiá <javier dot tia at gmail dot com>

pkgname='python-pygorithm'
_name=pygorithm
pkgver=1.0.4
pkgrel=1
pkgdesc='A Python module for learning all major algorithms'
url='https://github.com/OmkarPathak/pygorithm'
arch=('any')
license=('MIT')
depends=('python')
provides=("${_name}=${pkgver}")
source=("${url}/releases/download/v${pkgver}/${_name}-${pkgver}.tar.gz")
sha256sums=('214021a5abdb6bc7c5ed5a60ce4dd56d60ed9cdeb30a91cf7cf35332bb79d3a0')

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
