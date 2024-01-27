# Maintainer:  Misaka13514 <Misaka13514 at gmail dot com>
pkgname=frida-dexdump
pkgver=2.0.1
pkgrel=3
pkgdesc="A frida tool to dump dex in memory"
arch=('any')
url="https://github.com/hluwa/frida-dexdump"
license=('GPL-3.0-only')
depends=(
    'python'
    'python-click'
    'python-frida-tools'
    'python-wallbreaker'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('a7e643bee7f380e43b1dd460284d251d3581b7c18ca73219147e2ed0dc15f5c3')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation  
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" *.md
}
