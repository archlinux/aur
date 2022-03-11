# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

pkgname=python-bugzilla
pkgver=3.2.0
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://github.com/python-bugzilla/python-bugzilla"
license=(GPL2)
depends=("python" "python-requests" "python-docutils")
makedepends=("python-setuptools")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('27586ca68dcbcc00910a1d1beb25c144fa3617cc')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
