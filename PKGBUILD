# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=2.21.0
pkgrel=2
pkgdesc="Google's Firestore Python client library"
arch=('any')
url=https://github.com/googleapis/python-firestore
license=('Apache-2.0')
depends=('python' 'python-libcst')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/v${pkgver}.tar.gz)
b2sums=('2344322d5140fabb1b030d5f3629e14f1e5445c1b54bd392add2e40918e233830142f3a378365d846af5c1f06a2dab5fa89e72eaa9d510d84fb42c0b9c609048')

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
