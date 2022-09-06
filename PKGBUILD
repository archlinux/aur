# Maintainer: Wang Bing-hua <louiswpf@gmail.com>

pkgname=python-bottle-beaker
_pkgname=${pkgname/python-/}
pkgver=0.1.3
pkgrel=1
pkgdesc="Bottle plugin beaker, WSGI middleware for sessions and caching"
arch=('any')
url="https://bottlepy.org"
license=('MIT')
depends=('python-bottle' 'python-beaker')
makedepends=('python-setuptools')
source=("https://pypi.org/packages/source/${_pkgname:0:1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('36aec120bab18ff902b23ae34fc593a125cb56b4182e5f1205f1ff628d2694aa')

build() {
  cd "${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
