pkgname=ww-manager
pkgver=2.3.1
pkgrel=1
pkgdesc="ww-manager (A Wuthering Waves CLI Manager)"
arch=('any')
url="https://github.com/timetetng/wutheringwaves-cli-manager"
license=('MIT')
depends=(
  'python'
  'python-typer'
'python-rich'
'python-requests'
'python-certifi'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timetetng/wutheringwaves-cli-manager/archive/refs/tags/v2.3.1.tar.gz")
sha256sums=('70e285a2a95d3261ee4a45d9f9efaa83ea53ced09003b5ec41855ee65d872833')

build() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
