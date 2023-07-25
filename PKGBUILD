# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=3.0.0
pkgrel=1
pkgdesc="pytest plugin for testing mypy types, stubs, and plugins"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=(
  'python'
  'python-yaml' 'python-tomlkit'
  'python-pytest' 'mypy'
  'python-decorator' 'python-jinja' 'python-regex' 'python-packaging')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/typeddjango/pytest-mypy-plugins/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('785a741039c63ae5ee14e6d2b8b56b1fdaa545cca45bb328211bcb14ddc0642c')
b2sums=('e9b124b23f0e606b8d6f098c5834f8b70b44a6d7f374b0d4132c1fc47429a7a72a98ac96edd61a21969d4bc46a27c49cda35a9e0f71ed93361e0346debe643af')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
