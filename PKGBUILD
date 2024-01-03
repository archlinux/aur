# Maintainer: Moonlit Tune <moonlit underscore tune at protonmail dot com>

pkgname=certbot-dns-standalone
pkgver=1.1
pkgrel=1
pkgdesc="Standalone DNS server plugin for certbot verification"
arch=('any')
depends=('certbot' 'python-acme' 'python-dnslib')
makedepends=('python-setuptools')
checkdepends=('python-mock')
url="https://github.com/siilike/$pkgname"
license=('Apache-2.0')
source=($pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('79e38d4733de019e16f343aaeb18cf3aa8f5d4d53ffbbedfafb8e23d1710a792')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py test
}
