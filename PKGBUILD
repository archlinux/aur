# $Id$
# Maintainer: Boris Momcilovic <boris.momcilovic@gmail.com>

pkgname=certbot-dns-linode
pkgver=0.26.1
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
sha512sums=('7aa7254f76415919e7ecd2565900e1d507669ff5b134c22555c6d36035c0302fa16e0c2a2d580ebc806a819a064d53288071e4bf09c09c7d9dd37c70e877f6cc'
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

