# Maintainer: kukaan <a3VrYWFuQGluZmNvZi5jb20=>

_pkgname=deluge-client
pkgname=python-${_pkgname}
pkgver=1.9.0
pkgrel=1
pkgdesc="Simple python Deluge Client"
url="https://pypi.python.org/pypi/deluge-client"
license=('MIT')
arch=('any')
makedepends=('python-setuptools')
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
b2sums=('e4b002e45a3681700a3343cbae0664575348d6bf8cd9ede821d1bbe1e061773e8da8a48a631f7f1fdc5d70bca80bb49dbe18c4cff34b77e2692aa4881c9dcb20')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}


# vim:set sw=2 sts=2 ft=sh et:
