# Maintainer: valère monseur <valere dot monseur at ymail dot com>

pkgname=python-ghp-import
_pkgname=ghp-import
pkgver=0.4.1
pkgrel=2
pkgdesc='Copy your docs directly to the gh-pages branch'
arch=('any')
url="https://pypi.python.org/pypi/ghp-import"
license=(custom)
depends=('python')
makedepends=('python-setuptools')
replaces=('ghp-import')
conflicts=('ghp-import')
source=("http://pypi.python.org/packages/source/g/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('99e018372990c03ab355aa62c34965c5')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" -O1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
