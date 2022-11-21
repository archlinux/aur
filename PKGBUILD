# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=python38-k5test
pkgver=0.10.1
pkgrel=3
pkgdesc='Library for setting up self-contained Kerberos 5 environments'
url='https://github.com/pythongssapi/k5test'
arch=('any')
license=('custom')
depends=('python38' 'krb5')
makedepends=('python38-setuptools')
source=("https://github.com/pythongssapi/k5test/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('36687bed6f14a3e53446cc97a556ad16d053f2bf0ab58689bf252382d2374a663cf59c1a4157b11d0e6b07e2016f40e4d0fccb53d8503ed9eb507927a7dfec2b')
b2sums=('673d94d572b6d37d3124466f6875bece0d37e80a16b5abe43db6a4333eecf3f5e1337b67020d00c2337d87b390df29a57cd563461fec01cfc95ee69adb9a8a39')

build() {
  cd "k5test-${pkgver}"
  python3.8 setup.py build
}

package() {
  cd "k5test-${pkgver}"
  python3.8 setup.py install -O1 --root="${pkgdir}" --skip-build
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim: ts=2 sw=2 et:
