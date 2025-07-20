# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-restructuredtext_lint
_name=restructuredtext-lint
pkgver=1.4.0
pkgrel=4
pkgdesc="reStructuredText linter"
arch=('any')
url="https://github.com/twolfson/restructuredtext-lint"
license=('Unlicense')
depends=(
  'python-docutils'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('c2482d1f47e52674016a3079bdcfe53ccf18d9aab80595cb2fafc64fb866c00f')

build(){
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package(){
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
