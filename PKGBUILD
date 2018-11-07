# $Id$
# Maintainer: Alexandre Macabies <web+oss@zopieux.com>

pkgname=certbot-dns-alwaysdata
pkgver=0.27.1
pkgrel=1
pkgdesc="Alwaysdata DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=("certbot=$pkgver" "python-acme=$pkgver" 'python-mock' 'python-requests'
         'python-setuptools' 'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
validpgpkeys=('B19B88947C4F00ECF13164AA73B00C06DA31D499')
sha512sums=('328d869d16f23c7ee9994ad4e4f7c2e80eb45ed2c1be67580276aef21430bdee8f1d909175b43f940140b8c8160b85c41a5454d7e705ad82dabe40cd2a9ab4e3')

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
