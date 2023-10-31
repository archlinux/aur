# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
pkgname=frida-dexdump
pkgver=2.0.1
pkgrel=1
pkgdesc="A frida tool to dump dex in memory"
arch=('any')
url="https://github.com/hluwa/frida-dexdump"
license=('GPL3')
depends=(
    'python'
    'python-click'
    'python-frida-tools'
    'python-wallbreaker'
    'python-setuptools'
)
makedepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7e643bee7f380e43b1dd460284d251d3581b7c18ca73219147e2ed0dc15f5c3')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
