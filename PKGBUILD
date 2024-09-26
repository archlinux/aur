# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=2.19.0
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=('any')
url=https://github.com/googleapis/python-firestore
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('3e7f3d0e000fc2098859d3c3c9e3f97ad58c4070a532691c93436d38eef4690a')

build() {
  cd "python-firestore-$pkgver"
  python -m build --wheel --no-isolation
}


package() {
  cd "python-firestore-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:ts=2:sw=2:et:
