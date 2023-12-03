# Maintainer: Alan Beale <the.mrabz@gmail.com>

_name=fake-useragent
pkgname=python-fake-useragent
pkgver=1.4.0
pkgrel=1
pkgdesc='Up to date simple useragent faker with real world database'
arch=('any')
url=https://github.com/hellysmile/fake-useragent
license=('Apache')
depends=(python python-importlib-metadata)
makedepends=(
  'python-setuptools'
  'python-build'
  'python-installer'
  'python-wheel'
)
source=("https://github.com/fake-useragent/fake-useragent/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('2e9bfe327b8f0c283bfc877a43cf707e3002de067851ef125ddfe879035662d61c029de0ce4d28abedf294ec9aa36fc6a0c380c45f258fcc7945bd29863b4c4c')

build() {
  cd $_name-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl #--optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
