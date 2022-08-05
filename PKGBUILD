# Maintainer: Giovanni Harting <539@idlegandalf.com>

pkgname=python-libthumbor
_name=${pkgname#python-}
pkgver=2.0.2
pkgrel=1
pkgdesc="Python's extensions to thumbor"
arch=(any)
url="https://github.com/thumbor/libthumbor"
license=('MIT')
depends=(python)
makedepends=(python-build python-installer python-poetry python-poetry-core)
source=("https://github.com/thumbor/libthumbor/archive/$pkgver.tar.gz")
b2sums=('7682aeff1b7ea0cb026d08c16e73ffed2f3b9d59aa2329ca7d3fcb910860c9f495de53cfb17b651402af5e7166043634c1df334b8a8cc2c912a352b9e36157a1')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
