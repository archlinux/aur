# Maintainer: Aseem Athale <athaleaseem@gmail.com>
# Contributor: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=2.20.1
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=('any')
url=https://github.com/googleapis/python-firestore
license=('Apache-2.0')
depends=('python')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz"::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('a411f0e96ed9b80e5c6bfa4bf504cc272fd03fbff5f4309d1b2c0dfa2b53f306')

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
