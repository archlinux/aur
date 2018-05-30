# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

_name=django-flat-responsive
_srcurl="https://files.pythonhosted.org"
pkgname=("python-${_name}")
pkgver=2.0
pkgrel=2
pkgdesc="An extension for Django admin that makes interface mobile friendly"
arch=('any')
url="https://pypi.python.org/pypi/django-flat-responsive"
license=('BSD')
depends=('python-django')
source=("${pkgname}-${pkgver}.tar.gz::${_srcurl}/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        LICENSE)
md5sums=('0b861d898fcdb40488b0dffe4f38aba6'
         '66bbfefe64232ca4faefa917f58d8369')

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    mkdir -p "${pkgdir}"/usr/share/licenses/${pkgname}
    cp LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="${pkgdir}"/ --optimize=1
}
