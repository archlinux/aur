# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

pkgname=awslogs
pkgver=0.8.0
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
source=("https://files.pythonhosted.org/packages/source/${pkgname:0:1}/${pkgname}/${pkgname}-$pkgver.tar.gz")
md5sums=('31d055c1e0301bd6b1b7312a55587276')

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

