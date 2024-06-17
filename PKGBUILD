# Maintainer: zayn7lie <zayn7lie.ber7+git@gmail.com>

_pkgname='pynufft'
pkgname="python-${_pkgname}"
pkgver=2024.1.2
pkgrel=1
pkgdesc="PyNUFFT: Python non-uniform fast Fourier transform"
arch=('x86_64')
url="https://github.com/jyhmiinlin/${_pkgname}"
license=('MIT')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jyhmiinlin/pynufft/archive/${pkgver}.tar.gz")
sha256sums=('c2398a3718fda56f95cecd4994e9b66379114390a7f698647ae4251e46ec038f')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
