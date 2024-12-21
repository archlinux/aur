# Maintainer: Charles Leclerc <charles@la-mouette.net>

pkgname=certbot-dns-powerdns
pkgver=0.2.1
pkgrel=1
pkgdesc="PowerDNS DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-mock' 'python-setuptools'
         'python-zope-interface' 'python-dnspython' 'python-requests')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('a6b35b781e69ff898a8bf9247e8399864b9c05cf2b17f1a9200bab7810f82141')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py check
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
