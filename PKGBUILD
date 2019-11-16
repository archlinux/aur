# Maintainer: razer <razer[at]neuf[dot]fr>
pkgname=python-django-modeladmin-reorder
_pypi_pkgname=django-modeladmin-reorder
pkgver=0.3.1
pkgrel=1
pkgdesc="Custom ordering for the apps and models in the admin app"
arch=('any')
url="https://github.com/mishbahr/django-modeladmin-reorder"
license=('PSF')
source=("https://pypi.io/packages/source/d/${_pypi_pkgname}/${_pypi_pkgname}-${pkgver}.tar.gz")
makedepends=('python-django')
depends=('python-django')
sha256sums=('bf42d0dcd184b796b4d6d988c4b4cea7914adfc4430dd9978a8a0199051f189f')

build() {
    cd "${srcdir}/${_pypi_pkgname}-${pkgver}"
    python setup.py build || return 1
}

package() {
  cd "$srcdir/${_pypi_pkgname}-$pkgver"
  python3 setup.py install --root="$pkgdir/" --optimize=1
}
