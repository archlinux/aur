# Maintainer: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Thomas Conneely <tc116 at le dot ac dot uk>

pkgname=python-bitstring
pkgver=3.1.6
pkgrel=1
pkgdesc='Python module designed to help make the creation, manipulation and analysis of binary data as simple and natural as possible'
arch=('any')
url="https://scott-griffiths.github.io/bitstring/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/f4/87/fe6f7093088f4396e84c1b5d5dfb08c4840487ad46ff4805b7008c8f5ffc/bitstring-$pkgver.tar.gz)
md5sums=('38372014dd629be75c3a0ff7d799aa3f')
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
