# Maintainer: dianlujitao <dianlujitao at gmail dot com>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

pkgname=python-yalafi
pkgver=1.3.0
pkgrel=1
pkgdesc="Yet another LaTeX filter"
url="https://github.com/matze-dd/YaLafi"
depends=('python3' 'languagetool')
makedepends=('python-setuptools')
license=('GPL3')
arch=('any')
source=(
    "https://github.com/matze-dd/YaLafi/archive/$pkgver.zip"
    "ltdirectory.patch"
)
sha256sums=('4af3de71f254ca210a6638a09f49d09e339ef0ff4934d144513fb94fe5561d7e'
            'ff59913ed6c4cc63dcf47f9604d5a096bd30e152f14e36ec53fa1e37793e5c10')

prepare() {
    cd "$srcdir/YaLafi-$pkgver"
    patch -p1 < "$srcdir/ltdirectory.patch"
}

build() {
    cd "$srcdir/YaLafi-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/YaLafi-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
