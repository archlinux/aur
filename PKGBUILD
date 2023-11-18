# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Quan Guo <guotsuan@gmail.com>

pkgname=python-astroml
_name=astroML
pkgver=1.0.2.post1
pkgrel=1
pkgdesc="Machine learning, statistics, and data mining for astronomy and astrophysics"
arch=('any')
url="https://github.com/astroML/astroML"
license=('BSD')
depends=('python'
         'python-astropy'
         'python-matplotlib'
         'python-numpy'
         'python-scikit-learn'
         'python-scipy')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('45188a7a88a36ca3ec5a3aa04e5fa227f42d17415a6e168fb523375c1aabe291')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
