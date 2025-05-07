# Maintainer: Shane Blackthorne <arch@blackthorne.dev>
pkgname=lexy
pkgver=0.3.1
pkgrel=1
pkgdesc="A CLI tool to fetch tutorials from Learn X in Y Minutes"
arch=('x86_64')
url="https://github.com/antoniorodr/lexy"
license=('MIT')
depends=('bat' 'python>=3.13' 'python-beautifulsoup4' 'python-click' 'python-requests' 'python-typer' )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('1844df9727322728ff398a3339cdf34171c1a07899d36f4fb40adba938a74618')

build() {
    cd $pkgname-$pkgver || exit
    msg2 "Building package..."
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver || exit
    msg2 "Installing package..."
    python -m installer --destdir="$pkgdir" dist/*.whl
}
