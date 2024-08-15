# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=django-soft-delete
pkgname="python-${_pkgname}"
pkgver=1.0.14
pkgrel=1
pkgdesc="Soft delete models, managers, queryset for Django"
arch=("any")
url="https://github.com/san4ezy/django_softdelete"
license=('MIT')
depends=('python-django')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('428df56ea4fbb13f42d4f752f11f2a517aa31ac3d1b450e6b78c4c5d5d9dfc3b')

build() {
    cd "${_pkgname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pkgname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
