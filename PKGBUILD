# Maintainer: Hao Long <aur@esd.cc>

_module=alpha_vantage
pkgname=python-alpha_vantage
pkgver=2.1.3
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage Api"
url="https://github.com/RomelTorres/alpha_vantage"
depends=('python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('2d2128666b133dde2cd5e6a0bd368905e72522f7f0c10c40f5beb138ee61ba6e')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
