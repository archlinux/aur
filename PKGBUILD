# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=django-soft-delete
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=1.0.18
pkgrel=2
pkgdesc="Soft delete models, managers, queryset for Django"
arch=("any")
url="https://github.com/san4ezy/django_softdelete"
license=('MIT')
depends=('python-django')
makedepends=('python-build' 'python-hatchling' 'python-installer' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('d2f9db449a4f008e9786f82fa4bafbe4075f7a0b3284844735007e988b2a4df6')

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
