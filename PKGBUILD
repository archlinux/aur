# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=pytest-mypy-plugins
pkgname="python-$_pkgname"
pkgver=2.0.0
pkgrel=1
pkgdesc="pytest plugin for testing mypy types, stubs, and plugins"
arch=('any')
url="https://pypi.org/project/$_pkgname"
license=('MIT')
depends=('python' 'python-yaml' 'python-pytest' 'mypy' 'python-decorator' 'python-jinja' 'python-regex' 'python-packaging')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/typeddjango/pytest-mypy-plugins/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('2ee3ed84d336667a8331aeec921bb667c5361aaec695dc0567f45edc571a8f52')
b2sums=('a9def96003d85d76984067194abdbb5259379c09d359be6a3de7d4a68df2f8c7ebd033632c645297062564943b6cdee885c793172338b52110590be6911f6a75')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
