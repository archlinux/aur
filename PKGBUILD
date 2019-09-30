# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-google-cloud-firestore
pkgver=1.4.0
pkgrel=1
pkgdesc="Google's Firestore Python client library"
arch=('any')
url=https://github.com/googleapis/google-cloud-python
license=('APACHE 2.0')
depends=('python')
makedepends=(python-setuptools)
source=(https://github.com/googleapis/google-cloud-python/archive/firestore-${pkgver}.tar.gz)
sha256sums=('9282c10801280ec2a1996075235bcf3f8fd55ddeab1041aa91763735991bc8df')

prepare() {
  cd "$srcdir/google-cloud-python-firestore-$pkgver/firestore"
  #versioneer install 
}

build() {
  cd "$srcdir/google-cloud-python-firestore-$pkgver/firestore"
  python setup.py build
}


package() {
  cd "$srcdir/google-cloud-python-firestore-$pkgver/firestore"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

# vim:ts=2:sw=2:et:
