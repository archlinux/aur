# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-pooch
_pkgname=pooch
pkgver=1.5.1
pkgrel=1
pkgdesc="Python library for fetching and caching data files"
arch=('any')
url="https://www.fatiando.org/pooch/latest/"
license=('BSD 3-Clause')
depends=('python-requests' 'python-packaging' 'python-appdirs')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/6d/ea/16b71f7c67d28db3c9edb366289d3024082021315f93db9ff59bd6ec419f/pooch-${pkgver}.tar.gz")
sha256sums=('57ab0c43e9c5bd81227b08b9931435d71c118cd53339cc5925123a740f40b312')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
