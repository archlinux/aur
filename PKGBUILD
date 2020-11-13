# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

pkgname=python-bugzilla
pkgver=3.0.2
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://github.com/python-bugzilla/python-bugzilla"
license=(GPL2)
depends=("python" "python-requests" "python-docutils")
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('9c01f19ed38d91bd951460552b1c73b1b1b60265')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
