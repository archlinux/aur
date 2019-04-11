# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname='python-ssh2'
_pkgname='ssh2-python'
pkgver='0.18.0'
pkgrel=1
pkgdesc="Python bindings for libssh2"
url="https://github.com/ParallelSSH/ssh2-python/"
depends=('python' 'libssh2')
makedepends=('python-setuptools' 'cython')
checkdepends=('python-pytest')
license=('GPL')
arch=('x86_64')
source=("https://github.com/ParallelSSH/$_pkgname/archive/$pkgver.tar.gz")
sha256sums=('50e4168a911cd2a09ee802a6a301297907de64a5ecce36a1cbdb3a74d6563000')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py build_ext
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    SYSTEM_LIBSSH2=1 python setup.py install --root="${pkgdir}" --optimize=1
}

#check() {
    #cd "${srcdir}/${pkgname}-${pkgver}"
    #python setup.py build_ext --inplace
    #PYTHONPATH=. py.test
#}
