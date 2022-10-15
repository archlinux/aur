# Maintainer: dianlujitao <dianlujitao at gmail dot com>
# Contributor: Joakim Repomaa <aur@j.repomaa.com>

pkgname=python-yalafi
pkgver=1.3.1
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
sha256sums=('7e2985c11f6001d586e09a5cf2838479fe12600cfff315933941952110c67259'
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
