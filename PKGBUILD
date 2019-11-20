# Maintainer: Hao Zhang <hao at hao-zhang com>
# Contributor: Rich Li <rich at dranek com>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pyspf
pkgver=2.0.13
pkgrel=1
pkgdesc="Python implementation of the Sender Policy Framework (SPF) protocol"
arch=('any')
url="https://pypi.python.org/pypi/pyspf"
license=('PSF')
depends=('python-pydns')
makedepends=('python-setuptools')
optdepends=('python-authres: Return RFC 5451 Authentication Results headers')
source=("https://files.pythonhosted.org/packages/7a/0c/1a10db5bf17e13c596d47b0a6903ac2837f78c2c8faf5918c748cb83e3f8/pyspf-$pkgver.tar.gz")
sha256sums=('62dc1be39519e343202d480da7ef93d834b5a50cd4f217bef9335ed15292929b')

build() {
  cd "$srcdir/pyspf-$pkgver"
  python setup.py build
}

# The package requires installation before testing...so it won't work here
# check() {
# }
 
package() {
  cd "$srcdir/pyspf-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
