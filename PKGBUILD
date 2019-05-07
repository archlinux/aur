# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

_name=djangoql
_srcurl="https://files.pythonhosted.org"
pkgname=("python-${_name}")
pkgver=0.12.6
pkgrel=2
pkgdesc="Advanced search language for Django"
arch=('any')
url="https://github.com/ivelum/djangoql/"
license=('MIT')
depends=('python-django')
source=("${pkgname}-${pkgver}.tar.gz::${_srcurl}/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('80eb9b42d18e04bc31041dc573df991d')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    cp ${_name}-${pkgver}/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}"/ --optimize=1
}
