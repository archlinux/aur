# Maintainer: Jingbei Li <i@jingbei.li>
# Contributer: Jose Riha <jose1711 gmail com>

pkgname=python-pooch
_pkgname=pooch
pkgver=1.5.2
pkgrel=1
pkgdesc="Python library for fetching and caching data files"
arch=('any')
url="https://www.fatiando.org/pooch/latest/"
license=('BSD 3-Clause')
depends=('python-requests' 'python-packaging' 'python-appdirs')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-pip')
source=("https://files.pythonhosted.org/packages/b3/45/d2eaf68ab809155caef416f7281318b4b7753311ea415c9b066dac2dbf9a/pooch-${pkgver}.tar.gz")
sha256sums=('5969b2f1defbdc405df932767e05e0b536e2771c27f1f95d7f260bc99bf13581')

build() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
