# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=1.11.1
pkgrel=1
pkgdesc="pytest plugin for testing mypy types, stubs, and plugins"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-yaml' 'python-pytest' 'mypy' 'python-decorator' 'python-jinja' 'python-regex' 'python-packaging' 'python-chevron')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/typeddjango/pytest-mypy-plugins/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bba330c9ae81668069f9bcdfaa8af799e7f913eb3bae29113732336a97cbda3b')
b2sums=('a21b089321a3d632225e0ac6aa921b23bba111dcc5234c2ada32522b7659533970a9bd19bb432d3304b0291e32ba067ab75c549c4552ca742835155ab8e711b1')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
