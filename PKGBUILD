# Maintainer: Achilleas Pipinellis <axilleas archlinux.info>

pkgname=python-bugzilla
pkgver=2.5.0
pkgrel=1
pkgdesc="Bugzilla XMLRPC access module"
arch=(any)
url="https://github.com/python-bugzilla/python-bugzilla"
license=(GPL2)
depends=("python" "python-requests" "python-docutils")
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha1sums=('931be6aad427adb92ec9f490626c796fc82a65ed')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
}
