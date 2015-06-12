# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=ropper
_pkgname=Ropper
pkgver=1.5.3
pkgrel=1
pkgdesc="Show information about binary files and find gadgets to build rop chains for different architectures"
arch=('any')
url="https://github.com/sashs/Ropper"
license=('GPL2')
depends=('python-capstone' 'sqlite')
makedepends=('python-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/sashs/${_pkgname}/archive/v${pkgver}.tar.gz)
sha512sums=('4bb389edbf7619fac15deb114284691662782829414143e002ce6ec37401c9afcdf7644c557a7fb8783e44a36f0042a8145ecb0a5d08809ebe3eefb01fa8e165')

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
