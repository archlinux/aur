# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cast_control
pkgver=0.16.1
pkgrel=2
epoch=1
pkgdesc="Control Chromecasts from Linux and D-Bus"
arch=('any')
url="https://github.com/alexdelorenzo/cast_control"
license=('AGPL-3.0-or-later')
depends=(
  'python-aiopath'
  'python-app_paths'
  'python-appdirs'
  'python-click'
  'python-daemons'
  'python-gobject'
  'python-iteration-utilities'
  'python-mpris_server'
  'python-pychromecast'
  'python-pydbus'
  'python-rich'
  'python-validators'
)
makedepends=(
  'python-build'
  'python-hatchling'
  'python-installer'
  'python-wheel'
)
optdepends=('playerctl: Get the D-Bus name for your device')
conflicts=('chromecast_mpris')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('66ff3fdb4b22140f42f9fd2db2b734246f730fde80cfa45d07fd1e0eb20b08a6')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
