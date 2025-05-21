# Maintainer: Shane Blackthorne <arch@blackthorne.dev>

pkgname=lexy
pkgver=0.3.2
pkgrel=1
pkgdesc="A CLI tool to fetch tutorials from Learn X in Y Minutes"
arch=('x86_64')
url="https://github.com/antoniorodr/lexy"
license=('MIT')
depends=('bat' 'python>=3.13' 'python-beautifulsoup4' 'python-click' 'python-requests' 'python-typer' )
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('45d7145bcf79c5dfd1f19e3d45ff5b6c16674bbf5384d1645d5e2f12493622a3')

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
sha256sums=('45d7145bcf79c5dfd1f19e3d45ff5b6c16674bbf5384d1645d5e2f12493622a3')
