# Maintainer: Agil Mammadov <mamadovagil@tutamail.com>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-hwdata
pkgver=2.4.3
pkgrel=2
pkgdesc="Python bindings to hwdata"
arch=('any')
url="https://github.com/xsuchy/python-hwdata"
license=('GPL-2.0-or-later')
depends=(
  'hwdata'
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://github.com/xsuchy/python-hwdata/archive/refs/tags/$pkgname-$pkgver-1.tar.gz")
sha256sums=('f74bff7c42407413ed97a2f887496acfcc3b951aa480bfcd2857992bebeb007c')

build() {
  cd "$pkgname-$pkgname-$pkgver-1"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgname-$pkgver-1"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
