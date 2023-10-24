# Maintainer: Bozo Kopic <bozo@kopic.xyz>

pkgname=mkwhl
pkgver=0.3.0
pkgrel=1
pkgdesc="Python wheel creation utility"
url="https://github.com/bozokopic/mkwhl"
license=('GPL3')
arch=('any')
depends=('python-packaging' 'python-tomli')
source=("https://github.com/bozokopic/mkwhl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ad3df73d717f0a436792612efa32a2d2f969f3cab3270b2e195a96b0c6b56f99')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" build/*.whl
    install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
