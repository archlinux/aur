# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=3.2.0
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
sha256sums=('05e84f302fb5a17c9561ca16a3d405bf78a53150834ef0fd4f4b991f03e96beb')
b2sums=('60143ea5316cb3efd1aa356123cd40b52e7883dc201c22f108e0f4fb3aa3e9aae296920a1422cb1f8084c7657c29c955f07892b09a643a88f9024f726209ab6f')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
