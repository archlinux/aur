# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Tomislav Ivek <tomislav.ivek@gmail.com>

pkgname='python-node-semver'
pkgver=0.9.0
pkgrel=1
pkgdesc="python version of node-semver"
arch=('any')
url="https://github.com/podhmo/${pkgname}"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/podhmo/${pkgname}/archive/$pkgver.tar.gz")
sha512sums=('1ac32e271cf2b574ffbdf3c37aa5a13493ab03dbaa539b50614e9f91adea1078e0bee0451ae400b456e83de0493942ea209d7dd9aec4ab90a3e9753ba1c80082')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" 'dist/'*.whl
}
