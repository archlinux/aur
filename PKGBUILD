# Maintainer: Hao Long <aur@esd.cc>

_module=alpha_vantage
pkgname=python-alpha_vantage
pkgver=3.0.0
pkgrel=1
pkgdesc="Python module to get stock data from the Alpha Vantage Api"
url="https://github.com/RomelTorres/alpha_vantage"
depends=('python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
b2sums=('fb87126f84b1a5e97f0f81580faa7108b63e8672b3b999279b4c938a4057a84e04c389fbbf708cf6e754075300713556557be687b008e5482c77ebd0666b1143')

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
}
