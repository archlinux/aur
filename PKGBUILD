# Maintainer: fenuks
# Original maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=django_upgrade
pkgname=django-upgrade
pkgver=1.29.1
pkgrel=1
pkgdesc='Automatically upgrade your Django projects.'
arch=('any')
url='https://github.com/adamchainz/django-upgrade'
license=('MIT')
depends=('python' 'python-tokenize-rt')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
b2sums=('9999a7cceb45337bbadbdd2fbc189462bfb05084cab2706cc6d78c680999ca3d79aff1beb8a83fab622b8fd11755d6f61e89856ab5ceaac7825c863fc78a73b2')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
