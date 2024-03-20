# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=3.1.1
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
sha256sums=('019a44fde3ae6f8d16c30786ab9d6efb83b673cf951cf85981e776f2b9903e87')
b2sums=('6cc9e0ece887bbc8c473e74d73fddfa27c029b8e7b707d66302296f04b6e3a7667b0d63162ffd21022133a7084bba75b6a56dd85833a2004a1ea6defa4a0b3d6')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
