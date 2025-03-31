# Maintainer: Charles Leclerc <charles@la-mouette.net>

pkgname=certbot-dns-powerdns
pkgver=0.2.2
pkgrel=1
pkgdesc="PowerDNS DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://github.com/pan-net-security/$pkgname"
depends=('certbot' 'dns-lexicon' 'python-acme' 'python-mock' 'python-setuptools'
         'python-zope-interface' 'python-dnspython' 'python-requests')
source=("https://github.com/pan-net-security/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b6f51e967ee62f0bfe9a93649a939cae79595906335ba2635e12857889ffe843')

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
