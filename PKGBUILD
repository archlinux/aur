# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
_pkgname=pyocd-pemicro
pkgname=python-$_pkgname
pkgver=1.1.0
pkgrel=1
pkgdesc="Python On Chip Debugger and programmer for ARM Cortex-M microcontrollers using CMSIS-DAP"
url="https://github.com/pyocd/pyocd-pemicro"
depends=('python'
         'python-pypemicro'
         )
makedepends=('python-setuptools')
license=('BSD-3-Clause')
arch=('any')
source=("https://github.com/pyocd/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('7a9e6aca278d7c60d11836364d28b1a87d22779d0e31e40d108ce1b444b82c42f728c339735e8c327dbc513eb3617c4411280fb904bee29004567b6a6c0c117f')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1
}

