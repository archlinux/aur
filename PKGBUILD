# Maintainer: Bram Neijt <bram at neijt dot nl>
# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
pkgname=autotrash
pkgver=0.4.3
pkgrel=1
pkgdesc="Tool to automatically purge old trashed files"
arch=("any")
url="https://github.com/bneijt/autotrash"
license=(GPLv3)
depends=("python" "python-setuptools")
provides=("autotrash")
conflicts=("autotrash")
source=(
    https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
)
md5sums=('55c5db635d4de6fa2a2450192120dcc1')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
