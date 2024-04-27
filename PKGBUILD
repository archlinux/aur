# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=3.1.2
pkgrel=1
pkgdesc="pytest plugin for testing mypy types, stubs, and plugins"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=(
  'python'
  'python-yaml' 'python-tomlkit'
  'python-pytest' 'mypy'
  'python-decorator' 'python-jinja' 'python-regex' 'python-packaging' 'python-jsonschema' 'python-py')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/typeddjango/pytest-mypy-plugins/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aa5961475e52296454087d4bd05fa93bb5242ba7bebc8f2296f55d9013a903fb')
b2sums=('5147a26c51a3f95540bfcbdce4c1963204c177ec68bda9d0f1670f463e6bdca01053439b07aab8efc8c53b20f042b110aec87af87d1eda71e4850f0ee8e0b223')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
