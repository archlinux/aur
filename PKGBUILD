# Maintainer: Bram Neijt <bram at neijt dot nl>
# Maintainer: MithicSpirit <rpc01234 at gmail dot com>
pkgname=autotrash
pkgver=0.4.1
pkgrel=1
pkgdesc="Tool to automatically purge old trashed files"
arch=("any")
url="https://github.com/bneijt/autotrash"
license=(GPLv3)
depends=("python-arrow")
makedepends=("python-setuptools")
provides=("autotrash")
conflicts=("autotrash")
source=(
    https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz
)
md5sums=('ac7eb2c3cc54fa7b5420c6e379b974e3')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
