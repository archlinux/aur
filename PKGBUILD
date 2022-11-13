# Maintainer: Gustavo Costa <xfgusta@gmail.com>

pkgname=cexpl
pkgver=0.1.0
pkgrel=1
pkgdesc="Command-line tool to interact with Compiler Explorer"
arch=('any')
url="https://github.com/xfgusta/cexpl"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha1sums=('f0031a837a7cee6b315565ccfae88a6f0fe029ba')
makedepends=(python-setuptools)
depends=(python-requests python-colorama)

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname"
}
