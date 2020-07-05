# Maintainer: Charles Leclerc <charles@la-mouette.net>

pkgname=certbot-dns-powerdns
pkgver=0.2.0
pkgrel=1
pkgdesc="PowerDNS DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-mock' 'python-setuptools'
         'python-zope-interface' 'python-dnspython' 'python-requests')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('bc44490aa29985d39d49bb253155c88ae8fd71edb61cf347fb575e4773a120f1')

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
