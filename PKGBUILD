# Maintainer: Dct Mei <dctxmei@gmail.com>

pkgname=music-dl
pkgver=2.2.1
pkgrel=1
pkgdesc="Music-dl is a command line tool which helps you search and download music from multiple sources"
arch=('any')
url="https://github.com/0xHJK/music-dl"
license=('MIT')
depends=("python-click" "python-requests" "python-pycryptodome" "python-prettytable")
source=("$pkgname-$pkgver.tar.gz::https://github.com/0xHJK/music-dl/archive/v$pkgver.tar.gz")
sha512sums=("b6b393a986656e064501f81b5424b603fc19ea479249fb5c17a3ab9b5604c604d6b1d657355935864d3fe10610490b4aa8964d2dd1efa05f80f579f5816f5a6a")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
