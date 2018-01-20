# Maintainer: Wolfgang Mader <Wolfgang dot Mader at brain-frog dot de>

_name=django-flat-responsive
pkgname=("python-${_name}")
pkgver=2.0
pkgrel=1
pkgdesc="An extension for Django admin that makes interface mobile friendly"
arch=('any')
url="https://pypi.python.org/pypi/django-flat-responsive"
license=('BSD')
depends=('python-django')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        LICENSE)
md5sums=("0b861d898fcdb40488b0dffe4f38aba6"
         SKIP)

build() {
    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py build
}

package() {
    mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
    cp LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

    cd "${srcdir}/${_name}-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
