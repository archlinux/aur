# Maintainer: Marco Martinelli <marco+libzstd-seek@13byte.com>

pkgname=python-indexed-zstd
pkgver=1.5.1
pkgrel=1
pkgdesc="A bridge for libzstd-seek to python"
arch=('x86_64' 'aarch64')
url="https://github.com/martinellimarco/indexed_zstd"
license=('MIT')
depends=('python' 'zstd')
makedepends=('cython' 'git')
options=(!emptydirs)
source=("${pkgname}-${pkgver}::git+https://github.com/martinellimarco/indexed_zstd.git#tag=v${pkgver}")
provides=("indexed_zstd")
sha384sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    git submodule update --init
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --cython --root="$pkgdir/" --optimize=1
}
