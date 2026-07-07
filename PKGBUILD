# Maintainer: Neboer <rubinposter at gmail dot com>

pkgname=nxist-wifi-login
pkgver=0.1.0
pkgrel=1
pkgdesc="CLI tool for NXIST campus WiFi portal authentication and session management"
arch=('any')
url="https://github.com/Neboer/NXIST-WiFi-Login"
license=('MIT')
depends=('python' 'python-requests' 'python-beautifulsoup4' 'python-platformdirs' 'python-tabulate' 'python-wcwidth')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/Neboer/NXIST-WiFi-Login/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('227a193eeb499cfe2194f5621913c0bc559ba1fed846ea89d61450ad9c81ee99')

_srcname="NXIST-WiFi-Login"

build() {
    cd "$_srcname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_srcname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
