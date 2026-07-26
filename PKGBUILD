# Maintainer: frsaghna <frsaghna@github.com>
pkgname=weg-fm
pkgver=1.0.3
pkgrel=1
pkgdesc="Keyboard-first GTK4 file manager for Linux featuring desktop interop and multi-level undo"
arch=('any')
url="https://github.com/frsaghna/weg-fm"
license=('GPL-3.0-or-later')
depends=('gtk4' 'python-gobject' 'python')
optdepends=(
    'fd: for fast recursive fuzzy search'
    'ffmpegthumbnailer: for video thumbnail generation'
)
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('cf33bdcec841eb1b39c4f7e9f4681b50efd4cfefbd02d7e3fd45443cecbc9ba0')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
