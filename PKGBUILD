# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=python-sv-ttk
_name=sv_ttk
pkgver=2.6.1
pkgrel=1
pkgdesc="A gorgeous theme for ttk, based on Microsoft's Sun Valley visual styles"
arch=('any')
url="https://github.com/rdbende/Sun-Valley-ttk-theme"
license=('MIT')
depends=('python')
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1b076bc5dda31249c7b7a4f6ae89d1f36f2eef66c4075b90118a75b9eb6f5052')

build() {
  cd "Sun-Valley-ttk-theme-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "Sun-Valley-ttk-theme-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
