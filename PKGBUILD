# Maintainer: Gilrain <gilrain+libre.arch A_T castelmo DOT_ re>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=certbot-dns-infomaniak
pkgver=0.1.11
pkgrel=1
pkgdesc="Infomaniak DNS Authenticator plugin for Certbot"
arch=('any')
license=('Apache')
url="https://pypi.python.org/pypi/$pkgname"
depends=('certbot' 'python-setuptools' 'python-mock' 'python-requests-mock')
checkdepends=('python-pytest')
source=("https://pypi.io/packages/source/c/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('edf16927cd26901b4ee30bb2a5fa36487f29b6034c2868e2c29bf13173a1ca37')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py build
}

check() {
  cd "$srcdir"/$pkgname-$pkgver
  python -m pytest
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python setup.py install --root="$pkgdir"
}
