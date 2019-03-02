# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-panwid
pkgver=0.2.5
pkgrel=1
pkgdesc="A collection of widgets for urwid"
url="https://github.com/tonycpsu/panwid"
arch=('any')
license=('LGPL2.1')
depends=(
  'python-urwid' 'python-urwid_utils>=0.1.2' 'python-six' 'python-raccoon'
  'python-blist' 'python-orderedattrdict'
)
source=(
  "https://github.com/tonycpsu/panwid/archive/v$pkgver.tar.gz"
)
sha256sums=(
  '1646404886f158682eef5f76daa43e47513813d6f0349e6b54b0b9dc3f4b1ebf'
)

build() {
    cd "panwid-$pkgver"
    python setup.py build
}

package() {
    cd "panwid-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    rm -r "$pkgdir/usr/lib/python3.7/site-packages/test"
}
