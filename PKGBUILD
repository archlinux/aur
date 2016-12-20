# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname=python-bitstring
pkgver=3.1.5
pkgrel=1
pkgdesc='Python module designed to help make the creation, manipulation and analysis of binary data as simple and natural as possible'
arch=('any')
url="https://scott-griffiths.github.io/bitstring/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/f3/e5/dfe4c49c93d174a5fd807ed307d3a3f38c6b3e140972945f81a5f5578ca7/bitstring-$pkgver.zip)
md5sums=('70689a282f66625d0c7c3579a13e66db')
sha256sum=('1db5d54ee269f6b54d50c3eb257eea4b')

build() {
  cd ${srcdir}/bitstring-${pkgver}

  # get the license file
  python -c "import bitstring; print(bitstring.__licence__)" >> ${srcdir}/LICENSE
}

package() {
  cd ${srcdir}/bitstring-${pkgver}

  # build
  python setup.py install --root=${pkgdir}/ --optimize=1

  # install license
  install -D -m644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
