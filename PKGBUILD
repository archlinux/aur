# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/tv_viewer
pkgname=tv_viewer
pkgver=3.0.3
pkgrel=1
pkgdesc="GUI to view television show details using TV maze API. Python3 tkinter SQLite"
arch=('any')
url="https://github.com/gavinlyonsrepo/tv_viewer"
license=('GPL-3.0-or-later')
depends=('python' 'python-requests' 'python-urllib3' 'tk')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("https://github.com/gavinlyonsrepo/tv_viewer/archive/$pkgver.tar.gz")

sha256sums=('bb95e9f07e7b77b7f6b2f23ff73fa9aef64a71a7363c3e9ae1539003015a28ce')

build() {
    cd "$srcdir/tv_viewer-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/tv_viewer-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 desktop/tv_viewer.desktop "$pkgdir/usr/share/applications/tv_viewer.desktop"
    install -Dm644 desktop/tv_viewer.png "$pkgdir/usr/share/pixmaps/tv_viewer.png"
}
