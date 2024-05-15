# Maintainer: kukaan <a3VrYWFuQGluZmNvZi5jb20=>

_pkgname=deluge-client
pkgname=python-${_pkgname}
pkgver=1.10.2
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('21685a07a27f6ef726cd052869c46b086fce96f0b94277874e9e0489e0196d69ae993f2f402522b88a767339fc23d8885e0216245abe80bd289d820e521cdddc')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}


# vim:set sw=2 sts=2 ft=sh et:
