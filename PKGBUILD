# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname=python2-bitstring
pkgver=3.1.3
pkgrel=1
pkgdesc='Python module designed to help make the creation, manipulation and analysis of binary data as simple and natural as possible'
arch=('any')
url="http://code.google.com/p/python-bitstring/"
license=('MIT')
depends=('python2')
makedepends=('unzip')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/b/bitstring/bitstring-$pkgver.zip)
md5sums=('1db5d54ee269f6b54d50c3eb257eea4b')

build() {
  cd ${srcdir}/bitstring-${pkgver}

  #get the license file
  python2 -c "import bitstring; print(bitstring.__licence__)" >> ${srcdir}/LICENSE
}

package() {
  cd ${srcdir}/bitstring-${pkgver}

  # build
  python2 setup.py install --root=${pkgdir}/ --optimize=1

  #install license
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
