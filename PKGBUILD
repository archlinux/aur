# Maintainer: Andrea Scarpino <andrea at archlinux.org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python2-boto3
pkgver=1.10.39
pkgrel=1
pkgdesc='The AWS SDK for Python'
arch=('any')
license=('Apache')
url='https://github.com/boto/boto3'
depends=('python2-botocore' 'python2-jmespath' 'python2-s3transfer')
makedepends=('python2-setuptools')
# checkdepends=('python2-coverage' 'python2-nose' 'python2-mock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/boto/boto3/archive/$pkgver.tar.gz")
sha512sums=('6f1e5fbb10efb5ddf44f1769f83896b6dafad65027e85b94f3ac96f3925fa2ed443ea7f7befdeb97b3748d8f7f6bf2c385b901bea353571885390b503e4a25d4')

build() {
  cd boto3-$pkgver
  python2 setup.py build
}

check() {
  cd boto3-$pkgver
  # scripts/ci/run-tests
}

package() {
  cd boto3-$pkgver
  python2 setup.py install --root="$pkgdir" --optimize=1
}
