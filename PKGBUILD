# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Samed Beyribey <ras0ir AT eventualis DOT org>
pkgname=python-pydns
_realname=py3dns
pkgver=4.0.2
pkgrel=2
pkgdesc="A module for looking up DNS entries in Python applications"
arch=('any')
url="https://launchpad.net/py3dns"
license=('Python')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-flit')
source=("https://launchpad.net/${_realname}/trunk/${pkgver}/+download/${_realname}-${pkgver}.tar.gz")
md5sums=('1623680ae77bd4723ed75996cb85c48e')

build() {
  cd "$srcdir/$_realname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$_realname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
