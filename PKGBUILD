# Maintainer: Eugene Dvoretsky <radioxoma@gmail.com>

pkgname=lsdreader
pkgver=0.2.15
pkgrel=1
pkgdesc="Decompile ABBYY Lingvo LSD dictionaries to DSL"
arch=('any')
url="https://github.com/sv99/lsdreader"
license=('unknown')
depends=('python')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sv99/lsdreader/archive/v${pkgver}.tar.gz")
sha256sums=('2d13784d82c082e2784a1aef17600b566d548e42390eb472d616fd17768649b1')

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/\\n/ /g' setup.py  # ValueError: Newlines are not allowed
    python setup.py build
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
}
