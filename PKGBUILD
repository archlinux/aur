# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=awslogs
pkgver=0.15.0
pkgrel=1
pkgdesc="AWS CloudWatch logs for Humans™"
arch=('any')
license=('Apache')
url="https://github.com/jorgebastida/awslogs"
depends=('python>=3'
         'python-boto3'
         'python-jmespath'
         'python-termcolor'
         'python-dateutil')
makedepends=('python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jorgebastida/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('ece569396190695ac655626a8421f47eda0f1afce8c982bb14a3ccdfe1f82dd1427837721d567ce3e15cdaed700de844d589cae52a45fd717155cbf0ab2ce70e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
