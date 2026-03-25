pkgname=ww-manager
pkgver=2.1.6
pkgrel=1
pkgdesc="ww-manager (A Wuthering Waves CLI Manager)"
arch=('any')
url="https://github.com/timetetng/wutheringwaves-cli-manager"
license=('MIT')
depends=(
  'python'
  'python-typer'
'python-rich'
  'python-certifi'
  'python-typing_extensions'
)
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("$pkgname-$pkgver.tar.gz::https://github.com/timetetng/wutheringwaves-cli-manager/archive/refs/tags/v2.1.6.tar.gz")
sha256sums=('bd49f6a55258030dd2ad06258222b500bdc79715e5e9b46268d5df718d2f5447')

build() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
