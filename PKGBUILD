# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper
_pkgname=Ropper
pkgver=1.5.2
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
arch=('any')
url="https://github.com/sashs/Ropper"
license=('GPL2')
depends=('python-capstone' 'sqlite')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sashs/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('922120243854cb9231b8bae8b53eff63579b2ad7007d24af00d2eb7bf142c2847e10aa2c1d90717fee822d93718ee016c25a3563cd160e7a8a75d04bbdecf677')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
