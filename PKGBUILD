# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-urwid_utils
pkgver=0.1.2
pkgrel=2
pkgdesc="Simple, straightforward, but extensible utilities for the urwid package"
url="https://github.com/tonycpsu/urwid_utils"
arch=('any')
license=('MIT')
depends=('python-urwid')
makedepends=('python-setuptools')
source=(
  "https://github.com/tonycpsu/urwid_utils/archive/v$pkgver.tar.gz"
  "https://raw.githubusercontent.com/tonycpsu/urwid_utils/master/LICENSE"
)
sha256sums=(
  '1de90d77dec50eebc64b6a30f9ebc490f206ba75458613501e7b339acaf35c3a'
  '1a95acd108395a9feff4f28f448134ef686b2597d4ddb1c02a9b141361ae1898'
)

build() {
    cd "urwid_utils-$pkgver"
    python setup.py build
}

check() {
    cd "urwid_utils-$pkgver"
    python setup.py test
}

package() {
    cd "urwid_utils-$pkgver"
    python setup.py install --root="$pkgdir/" --prefix=/usr --optimize=1 --skip-build
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
