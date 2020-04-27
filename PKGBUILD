# Maintainer: Hao Long <aur@esd.cc>

_module=alpha_vantage
pkgname=python-alpha_vantage
pkgver=2.2.0
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage Api"
url="https://github.com/RomelTorres/alpha_vantage"
depends=('python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('919504b709f59f9d16642a620c898952d1d9634b4459bdf0c17539f24c403350')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
