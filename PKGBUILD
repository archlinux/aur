# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>

pkgname=python-lzf
_name=${pkgname}
pkgver=0.2.4
pkgrel=4
pkgdesc="C Extension for liblzf"
arch=('x86_64')
url="https://github.com/teepark/python-lzf"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/release-$pkgver.tar.gz")
sha256sums=('a5197f7639112511d359e49e5bcaa28031eb57a6a6804d75bdde566ed3484c78')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
