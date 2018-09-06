# $Id$
# Maintainer: Boris Momcilovic <boris.momcilovic@gmail.com>

pkgname=certbot-dns-linode
pkgver=0.27.0
pkgrel=1
pkgdesc="Linode DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=("certbot=$pkgver" 'dns-lexicon' "python-acme=$pkgver" 'python-mock' 'python-setuptools'
         'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('ac6ee01058ef22dc4c08da4f8fee9f5b3db58e99849d57b919e28b87938f8b9ebb6c363e06d4b74cd23b07a4f23e33d7db948653b658f45ed8e020ece7f9ccea'
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

