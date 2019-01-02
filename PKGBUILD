# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

pkgname=awslogs
pkgver=0.11.0
pkgrel=0
pkgdesc="AWSLogs client"
arch=('any')
license=('Apache')
url="https://github.com/jorgebastida/awslogs"
depends=('python>=3'
         'python-boto3>=1.2.1'
         'python-jmespath>=0.7.1' 'python-jmespath<1.0.0'
         'python-termcolor>=1.1.0'
         'python-dateutil>=2.4.0')
makedepends=('python-wheel')
source=("https://github.com/jorgebastida/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('30118717535ef46acc387473a0dffc61169e234b290555097db4d0deb0cfedba23a18147c9c40bc1f983f5ac18a051f057ec6aaa13a1ca8d7caa23e3c53a3e1b')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  # skipping
  # python setup.py test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

