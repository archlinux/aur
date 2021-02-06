# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=python-sphinx-glpi-theme
pkgver=0.3
pkgrel=1
pkgdesc='A Sphinx theme based on readthedocs.org one'
arch=('any')
url='https://github.com/glpi-project/sphinx_glpi_theme/'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/glpi-project/sphinx_glpi_theme/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c753534f6a0f9c0a6ac622e60f38f08ff7e234be1d27c97e0604ad19192b0af5')

build() {
    cd "sphinx_glpi_theme-${pkgver}"
    python setup.py build
}

package() {
    cd "sphinx_glpi_theme-${pkgver}"
    PYTHONHASHSEED='0' python setup.py install --root="$pkgdir" --skip-build --optimize='1'
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
