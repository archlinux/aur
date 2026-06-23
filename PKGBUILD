# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname='python-node-semver'
pkgver=0.9.1
pkgrel=1
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/podhmo/${pkgname}/archive/$pkgver.tar.gz")
sha512sums=('e9f305920a250bfc3f0cc305c15c8c4317b2871ceeeeaab90df5df68ab94d1255898638bd5ce93743b00b7dfc25bc47f51aa2bdb41b8ec8e5dd3646d7d8a17fc')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" 'dist/'*.whl
}
