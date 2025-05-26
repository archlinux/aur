# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=lexy
pkgver=0.4.0
pkgrel=1
pkgdesc="A CLI tool to fetch tutorials from Learn X in Y Minutes"
arch=('x86_64')
url="https://github.com/antoniorodr/lexy"
license=('MIT')
depends=('bat' 'python>=3.13' 'python-beautifulsoup4' 'python-click' 'python-requests' 'python-typer' )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('948c70f2e565798af604c700c53d01b1f8e4509da6268a5d5d6053f219a6940b')

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
sha256sums=('948c70f2e565798af604c700c53d01b1f8e4509da6268a5d5d6053f219a6940b')
