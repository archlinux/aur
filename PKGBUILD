# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=python38-pyasn1
pkgver=0.4.8
pkgrel=7
arch=('any')
url="https://github.com/etingof/pyasn1"
license=('BSD')
pkgdesc="ASN.1 library for Python 3"
depends=('python38')
makedepends=('python38-setuptools')
replaces=('pyasn1')
provides=('pyasn1')
source=(https://pypi.io/packages/source/p/pyasn1/pyasn1-$pkgver.tar.gz)
sha512sums=('e64e70b325c8067f87ace7c0673149e82fe564aa4b0fa146d29b43cb588ecd6e81b1b82803b8cfa7a17d3d0489b6d88b4af5afb3aa0052bf92e8a1769fe8f7b0')

check() {
  cd pyasn1-${pkgver}
  python3.8 setup.py test
}

package() {
  cd pyasn1-${pkgver}
  python3.8 setup.py install --root="${pkgdir}"
  install -D -m 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
