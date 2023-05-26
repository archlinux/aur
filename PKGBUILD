# Maintainer: kukaan <a3VrYWFuQGluZmNvZi5jb20=>

_pkgname=libtc
pkgname=python-${_pkgname}
pkgver=1.3.4
pkgrel=1
pkgdesc="Library to interface with a variety of torrent clients"
arch=('any')
url="https://github.com/JohnDoee/libtc"
license=('MIT')
depends=('python'
         'python-pytz'
         'python-requests'
         'python-click>=8.0'
         'python-tabulate>=0.8.7'
         'python-deluge-client>=1.9.0'
         'python-publicsuffixlist>=0.8.0'
)
source=("https://pypi.io/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('965a7c41096a69d003122955e2663ebc9e5cc8db9080a49d6f1d41b1b79f9927')

build() {
    cd "${_pkgname}-${pkgver}"
    python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --optimize=1 --prefix=/usr --root="${pkgdir}"
}

# vim:set sw=2 sts=2 ft=sh et:
