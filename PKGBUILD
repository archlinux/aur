# Maintainer: Simon Legner <Simon.Legner@gmail.com>
pkgname=python-mwoauth
pkgdesc="A generic MediaWiki OAuth handshake helper for Python"
pkgver=0.3.0
pkgrel=1
arch=('any')
url="https://github.com/mediawiki-utilities/python-mwoauth"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mediawiki-utilities/$pkgname/archive/refs/tags/v${pkgver}.tar.gz")
depends=('python')
makedepends=('python-setuptools')

check() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py check
}

package() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm755 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

sha512sums=('4d07726687e55669d63de00c5ef2a65400e7c62c269e99c26e3b26873d93074434f96fb886eaa57fffc7738e2f763a84f833b44ff33e27a523a0e9ab930d6dd4')
