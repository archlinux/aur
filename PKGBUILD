# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gergely Imreh <imrehg(at)gmail(dot)com>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>

pkgname=python38-netifaces
pkgver=0.11.0
pkgrel=3
pkgdesc="Portable module to access network interface information in Python"
arch=('x86_64')
url="https://alastairs-place.net/netifaces/"
license=('MIT')
depends=('python38')
makedepends=('python38-setuptools')
source=("https://pypi.io/packages/source/n/netifaces/netifaces-${pkgver}.tar.gz")
sha512sums=('a53110efb78c89c4d72d002104866253a4c085dd27ff9f41d4cfe3811cc5619e7585ceda4e91e83cdd0645c40c745c61d205708ee9a34427b35f437a48f148e5')

build() {
  cd "${srcdir}/netifaces-${pkgver}"

  python3.8 setup.py build
}

package() {
  cd "${srcdir}/netifaces-${pkgver}"

  python3.8 setup.py install --root "${pkgdir}" --skip-build

  # Install license, that is inside the readme file
  install -Dm644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
