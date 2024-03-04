# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=3.1.0
pkgrel=1
pkgdesc="pytest plugin for testing mypy types, stubs, and plugins"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=(
  'python'
  'python-yaml' 'python-tomlkit'
  'python-pytest' 'mypy'
  'python-decorator' 'python-jinja' 'python-regex' 'python-packaging' 'python-jsonschema')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/typeddjango/pytest-mypy-plugins/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c3b7b2ffa8150101517ebbfdd229d09f9ce8a403182ae469750d48580b70969c')
b2sums=('b4cae94e254f8da0ef8cd081479cbee4522150843ef3bbbd16ae6efe6722e44e84aa49e761e99699b75c94f8b44963e8f9eeefb5c5b3352411df4801a1bbc5b4')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
