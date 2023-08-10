# Maintainer: Dringsim <dringsim@qq.com>

pkgname=python-emotlib
_name=${pkgname#python-}
pkgver=1.0.1
pkgrel=1
pkgdesc="Python emoji + emoticon Library"
arch=('any')
url="https://github.com/steven5538/emotlib"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
source=("https://github.com/steven5538/emotlib/archive/refs/tags/v1.0.1.zip")
sha256sums=('BDC49A32D2F2FBD29BCBAC46A0FF1F2B7501A7F53AC2339F520A4612BF3CD4BD')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}