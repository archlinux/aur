# Maintainer: fenuks
# Original maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=django_upgrade
pkgname=django-upgrade
pkgver=1.30.0
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('7ac6af2c55efc9fbf6f50dbe6526eefe1ed405be58febba8513fb6b3f7d9cbab9a3ab685989c576ed49eb68659a6cfe1780b10b94aa285dc2a7f37c2b506e8e4')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
