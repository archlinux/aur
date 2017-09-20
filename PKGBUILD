# Maintainer: Andrea Ratto <andrearatto_liste@yahoo.it>

pkgname=awslogs
pkgver=0.10
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
sha512sums=('f4a042f1f107f018b02d002c400f2679900c330424e7cb4ded544313cff6a46fe6c3cf579fea04319ad75504d4f157b5bc735414be64cd05d9d63d377b315181')

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

