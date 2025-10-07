pkgname=('python-linux-gpib')
_pkgname=('linux-gpib')
pkgver=4.3.7
_pkgver=4.3.7
pkgrel=1
pkgdesc='A support package for GPIB (IEEE 488) hardware - Python 3 bindings'
arch=('i686' 'x86_64')
url='http://linux-gpib.sourceforge.net/'
license=('GPL')
depends=('linux-gpib' 'python')
makedepends=('python-setuptools')
source=("http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}%20for%203.x.x%20and%202.6.x%20kernels/${_pkgver}/${_pkgname}-${pkgver}.tar.gz")
md5sums=('c5cfe0254102c72812a341cdbcfc8836')

prepare() {

    msg "Unpacking userland utils source"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    tar xvfz "${_pkgname}-user-${pkgver}.tar.gz"
    cd ${_pkgname}-user-${pkgver}

}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-user-${pkgver}/language/python/"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}/${_pkgname}-user-${pkgver}/language/python/"
    python setup.py install --prefix=/usr --root=${pkgdir}

}

# vim:ts=4:et:sw=4
