# Maintainer: Zhang.j.k <zhangjk67 at gmail dian com>

pkgname=('python-djangorestframework')
_module='djangorestframework'
pkgver='3.12.4'
pkgrel=1
pkgdesc="Web APIs for Django, made easy."
url="https://www.django-rest-framework.org/"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('f747949a8ddac876e879190df194b925c177cdeb725a099db1460872f7c0a7f2')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
