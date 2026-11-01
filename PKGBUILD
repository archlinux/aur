# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-strenum
_name=StrEnum
pkgver=0.5.0
pkgrel=1
pkgdesc="A Python Enum that inherits from str."
arch=('any')
url="https://github.com/irgeek/StrEnum"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::https://github.com/irgeek/StrEnum/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('862d7a42fa77ae4b85f56e158ff7357c1d0d69e716a84db80b791683e0415b7b')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
