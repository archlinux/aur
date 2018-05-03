# $Id$
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>

pkgname=certbot-dns-alwaysdata
pkgver=0.24.0
pkgrel=1
pkgdesc="Alwaysdata DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=("certbot=$pkgver" "python-acme=$pkgver" 'python-mock' 'python-requests'
         'python-setuptools' 'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('B19B88947C4F00ECF13164AA73B00C06DA31D499')
sha512sums=('41a605620fce9ba84203b630f944c6c1e1cae92695d76ef89bb7b9c4f89f03cc1d64ece64c7ecb1c395d4dcb9f4eae3f267e359d21bf2e1327ee653106e9cb11'
            'SKIP')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py test
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
