pkgname=ww-manager
pkgver=2.2.4
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/timetetng/wutheringwaves-cli-manager/archive/refs/tags/v2.2.4.tar.gz")
sha256sums=('55f91e07a3f01054a53124953afbf99819bcc3d3ae3976b8fa441098e2849768')

build() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/wutheringwaves-cli-manager-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
