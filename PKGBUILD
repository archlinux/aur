# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=devpi-common
pkgver=3.6.0
pkgrel=3
pkgdesc="Utilities jointly used by devpi-server and devpi-client"
arch=('any')
url="https://doc.devpi.net/"
license=('MIT')
groups=('devpi')
depends=(
  'python>=3.4'
  'python-lazy'
  'python-py>=1.4.20'
  'python-requests>=2.3.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('fc14aa6b74d4d9e27dc2e9cbff000ed9be5cd723d3ac9672e66e4e8fce797227')

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:
