# Maintainer: Dawaman43 <github.com/Dawaman43>
pkgname=fifu
pkgver=1.1.2
pkgrel=1
pkgdesc="A cross-platform TUI for downloading YouTube videos from channels"
arch=('any')
url="https://github.com/Dawaman43/fifu"
license=('MIT')
depends=('python' 'python-textual' 'yt-dlp' 'python-click')
makedepends=('python-build' 'python-installer' 'python-hatchling')
source=("https://github.com/Dawaman43/fifu/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
