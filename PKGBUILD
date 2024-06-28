# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=2.16.1
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=('any')
url=https://github.com/googleapis/python-firestore
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/googleapis/python-firestore/archive/v${pkgver}.tar.gz)
sha256sums=('4ebe227b6fa7a52342f7eb88f2f43ff4ed3b7e157f50199ecdcd635aa87d2895')

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
