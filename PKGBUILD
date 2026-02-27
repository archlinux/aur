# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-logboth
_name=${pkgname#python-}
pkgver=0.2.0
pkgrel=1
pkgdesc="Python library for logging to stdout and a file"
arch=('any')
url="https://gitlab.com/zehkira/logboth"
license=('0BSD')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://gitlab.com/zehkira/logboth/-/archive/v$pkgver/$_name-v$pkgver.tar.gz")
sha256sums=('f54a500f1c4678beab566c96495d8a8c544622921832423ab11d67bdb8a71bfa')

build() {
  cd "$_name-v$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_name-v$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
