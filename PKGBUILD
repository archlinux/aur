# Maintainer: noideaman <packages@weebvr.com>
pkgname=python-tinyoscquery
_pkgname=tinyoscquery
pkgver=0.1.3
pkgrel=1
pkgdesc="OSCQuery for Python"
arch=("any")
url="https://github.com/cyberkitsune/$pkgname"
license=("MIT")
depends=("python" "python-zeroconf" "python-requests")
makedepends=("python-setuptools")
conflicts=("${pkgname}" "${pkgname}-git")
source=("https://github.com/cyberkitsune/${_pkgname}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('e6548c89827fe0dbbf4b2b621aa4e7efeb97890f14ecc0debc1dabec84d16bd3')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 || return 1
}

