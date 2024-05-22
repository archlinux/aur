# Maintainer: Peter Nokes <peter@peternokes.co.uk>

pkgname=python-pillow_heif
author=bigcat88
pkgver=0.16.0
pkgrel=1
pkgdesc="Python bindings to libheif for working with HEIF images and plugin for Pillow."
arch=('any')
url="https://github.com/bigcat88/pillow_heif"
license=('MIT')
depends=('python' 'python-setuptools' 'libheif' 'x265' 'aom' 'libde265')
makedepends=('python-pip')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bigcat88/pillow_heif/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('81d6fe55172ad75b18f4c8a52f234a0da06aa97314e2829bea7bac9fa16635e7')

build() {
    cd "$srcdir/pillow_heif-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/pillow_heif-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
