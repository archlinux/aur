# Maintainer: Lex Black <autumn-wind at web dot de>

_pkgname=canto-next
pkgname=canto-daemon
pkgver=0.9.7
pkgrel=1
pkgdesc="News aggregator for Atom/RSS/RDF"
url="https://codezen.org/canto-ng/"
license=('GPL')
arch=('any')
depends=('python-feedparser')
optdepends=('python-requests: Needed by inoreader plugin')
provides=('canto-next-git=0.9.7')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/themoken/${_pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('cd95ca7bcd34b66e72094035a408e8f7')


build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --prefix=/usr --root=${pkgdir} --optimize=1 --skip-build
}
