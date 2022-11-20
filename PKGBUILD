# Maintainer: Morten Linderud <foxboron@archlinux.org>
# Contributor: Jonathan Kotta <jpkotta AT gmail DOT com>

pkgname=python38-sqlparse
pkgver=0.4.3
pkgrel=1
pkgdesc='Non-validating SQL parser for Python'
arch=('any')
url=https://github.com/andialbrecht/sqlparse
license=('BSD')
depends=('python38')
makedepends=('python38-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/andialbrecht/sqlparse/archive/$pkgver.tar.gz")
sha256sums=('4f0562bbfe48242689cfe42c34ab035982b6c96a98c9753f458c00c6d147c20d')

build() {
  cd sqlparse-$pkgver
  python3.8 setup.py build
}

package() {
  cd sqlparse-$pkgver
  python3.8 setup.py install --prefix=/usr --root="$pkgdir" --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
