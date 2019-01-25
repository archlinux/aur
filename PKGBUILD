# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=0.30.1
pkgrel=1
pkgdesc="OVH DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-mock' 'python-setuptools'
         'python-zope-interface')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('757d84e1cf459a76d8432b44632a6d486453fcb4c3ab0da5772fb9f5114434db9cee0020306187b93f8396ab9570554f53731b34de386279c7c4d7f6c4156519'
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
