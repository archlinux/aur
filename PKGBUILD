# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cast_control
pkgver=0.14.0
pkgrel=3
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
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
optdepends=(
  'playerctl: Get the D-Bus name for your device'
)
conflicts=('chromecast_mpris')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('01b88c1d9305d812222f5598597519bd52ab0568246b876fa2799833fb69abbd')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
