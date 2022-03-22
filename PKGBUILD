# Maintainer: Christopher Arndt <chris@chrisarndt.de>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=sfzlint
pkgver=0.1.4
pkgrel=1
pkgdesc='A linter and parser for SFZ files'
arch=(any)
url='https://github.com/jisaacstone/sfzlint'
license=(GPL)
depends=(python-appdirs python-lark-parser python-yaml)
makedepends=(python-setuptools)
options=(!emptydirs)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/jisaacstone/sfzlint/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('63f77a38dd9b4c836c8206351f7a6dff1a0737f41a6786a415b4c799ebac685c')

build() {
    cd $pkgname-$pkgver
    python setup.py build
}

package() {
    cd $pkgname-$pkgver
    python setup.py install --skip-build --root="$pkgdir"/ --optimize=1
}
