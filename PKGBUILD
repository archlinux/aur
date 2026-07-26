# Maintainer: frsaghna <frsaghna@github.com>
pkgname=weg-fm
pkgver=0.1.0
pkgrel=3
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
sha256sums=('264ec4f59a972fabb95ba1b3e3bc1660bfce93010aa7567f98c7538325630473')

build() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    /usr/bin/python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
