# Maintainer: Chris Oelmueller <chris.oelmueller@gmail.com>
# Contributor: Han Xiao <arak.hx@gmail.com>

pkgname=python2-gvgen
_name=${pkgname#python2-}
pkgver=1.0
pkgrel=1
pkgdesc='Generates dot language files for easy scripting, to be processed with graphviz.'
arch=('any')
url='https://github.com/stricaud/gvgen'
license=('GPL2')
depends=('python2')
makedepends=()
source=("https://github.com/stricaud/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('4f7430fbe65eee5d93c64b8f063b806f')
sha256sums=('47510a6eb70a7a435bdcdf56e58b08a6bf3c8adf42e4ae5430d9fb9b7760872b')

PYTHON='python2'

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  $PYTHON setup.py build
}

package() {
    cd "$srcdir/${_name}-${pkgver}"
    $PYTHON setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
