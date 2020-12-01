# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-click-option-group
_pkgname=click-option-group
pkgver=0.5.2
pkgrel=1
pkgdesc="Option groups missing in Click"
arch=("any")
url="https://github.com/click-contrib/click-option-group"
license=('BSD')
depends=('python-click')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${url}/raw/master/LICENSE")
sha256sums=('743733a0f564438b6b761f49ddf37d845f9a662294ecabe0e832e597208bcf31'
            'a1c5c6628debcad64ee214620dc936bacc4e64063fbd34c7d745970cb1c5b589')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 ${srcdir}/LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
