# Maintainer: Hao Long <aur@esd.cc>

_module=alpha_vantage
pkgname=python-alpha_vantage
pkgver=2.3.1
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage Api"
url="https://github.com/RomelTorres/alpha_vantage"
depends=('python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0ce76908c3e2a22f9bbdacead90195ec3a4fa41ef8ae7c69a4a2fc99459bfbec')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
