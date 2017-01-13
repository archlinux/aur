# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgbase=('python-feather')
pkgname=('python-feather')
_module='feather'
pkgver='0.3.1'
pkgrel=1
pkgdesc="Fast, interoperable binary data frame storage for Python, R"
url="https://github.com/wesm/feather"
depends=('python'
    'python-pandas>=0.17.1')
makedepends=('python-setuptools'
    'cython')
license=('Apache')
arch=('i686' 'x86_64')
source=("https://github.com/wesm/feather/archive/v$pkgver.tar.gz")
md5sums=('3700893e1f21bc850c9e80446d82c185')

build() {
    cd "${srcdir}/${_module}-${pkgver}/python"
    ln -s ../cpp/src src
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}/python"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
