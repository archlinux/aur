# Maintainer: frsaghna <frsaghna@github.com>
pkgname=weg-fm
pkgver=1.0.2
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
sha256sums=('a7f233650bcf31354522ffa2096d1ff6419246df8f737bd9e20b492b612f99e2')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
