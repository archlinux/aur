# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Samuel Laurén <samuel.lauren@iki.fi>

pkgname=python38-gssapi
pkgver=1.8.2
pkgrel=1
pkgdesc='Provides both low-level and high level wrappers around the GSSAPI C libraries'
url='https://github.com/pythongssapi/python-gssapi'
arch=('x86_64')
license=('ISC')
depends=('python' 'python38-decorator' 'krb5')
makedepends=('python38-setuptools' 'cython')
checkdepends=('python38-parameterized' 'python38-k5test')
source=("https://github.com/pythongssapi/python-gssapi/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('b3003351aba19553031a1a4343b8c1b93474c9464e166f3a53d1b411b70378363229594f3a1fdee7448aa9981475b654d0996b8b75baa0411dd57fc8740720f4')
b2sums=('be3a8776342d9dfa69ad8a3cf0d7926719bc63881f837623e554b66324c74a1de079c64e1453fd1adc3bece7cb2c53d8a4c3ad6e3aa674cf126b075c863790ea')

build() {
  cd "${pkgname}-${pkgver}"
  python3.8 setup.py build
}

check() {
  cd "${pkgname}-${pkgver}"
  python3.8 setup.py test
}

package() {
  cd "${pkgname}-${pkgver}"
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
