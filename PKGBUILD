# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

pkgname=python-bugzilla
pkgver=3.0.1
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://github.com/python-bugzilla/python-bugzilla"
license=(GPL2)
depends=("python" "python-requests" "python-docutils")
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('b913f9a4bf0f6a5593feee6bd1c7a1bd12dfa5d1')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
