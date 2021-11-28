# Maintainer: Dario Ostuni <dario.ostuni@gmail.com>

pkgname=python-indexed-zstd
pkgver=1.3.1
pkgrel=1
pkgdesc="A bridge for libzstd-seek to python"
arch=('x86_64' 'aarch64')
url="https://github.com/martinellimarco/indexed_zstd"
license=('MIT')
depends=('python')
makedepends=('cython' 'git')
options=(!emptydirs)
source=("${pkgname}-${pkgver}::git+https://github.com/martinellimarco/indexed_zstd.git#tag=v${pkgver}")
sha384sums=('SKIP')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    git submodule update --init
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    python setup.py install --cython --root="$pkgdir/" --optimize=1
}
