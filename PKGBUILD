# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=1.9.0
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=(x86_64)
url=https://github.com/googleapis/python-firestore
license=(APACHE)
depends=('python')
makedepends=(python-setuptools)
source=(https://github.com/googleapis/python-firestore/archive/v${pkgver}.tar.gz)
sha256sums=('889ea0f4a8926c796f055627f12db96c4d29632159eff5b7032cfecd23283093')

prepare() {
  cd "python-firestore-$pkgver"
  #versioneer install 
}

build() {
  cd "python-firestore-$pkgver"
  python setup.py build
}


package() {
  cd "python-firestore-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
