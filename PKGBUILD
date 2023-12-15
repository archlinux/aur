# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=2.14.0
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=(x86_64)
url=https://github.com/googleapis/python-firestore
license=(APACHE)
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=(https://github.com/googleapis/python-firestore/archive/v${pkgver}.tar.gz)
sha256sums=('9228471af3dc6fc8e8c80cf43ab19ef2bb497b848a00d0af276edc31461e564a')

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
