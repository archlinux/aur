# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-ovh
pkgver=1.6.0
pkgrel=1
pkgdesc="OVH DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-mock' 'python-setuptools'
         'python-zope-interface')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz"{,.asc})
validpgpkeys=('148C30F6F7E429337A72D992B00B9CC82D7ADF2C'
              '1B41B758F9A78C7F444C20FA3E5B4152E3ADB1FD'
              'A2CFB51FA275A7286234E7B24D17C995CD9775F2')
sha512sums=('212666716a4731fddd66581327e41a988ed1a73cedab606bf37427d0b3a93e841c012934e5faf60c172593642a7a995a755fda430bc7fbb4f449c7c8ab17b363'
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
