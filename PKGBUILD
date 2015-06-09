# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Gergely Imreh <imrehg@gmail.com>
# Contributor: Ghost of Kendo <ghostofkendo@gmail.com>

pkgname=python-netifaces
pkgver=0.10.4
pkgrel=2
pkgdesc="Portable module to access network interface information in Python"
arch=('i686' 'x86_64')
url="http://alastairs-place.net/netifaces/"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/n/netifaces/netifaces-${pkgver}.tar.gz")
md5sums=('36da76e2cfadd24cc7510c2c0012eb1e')

package() {
  cd "${srcdir}/netifaces-${pkgver}"
  python setup.py install --root "${pkgdir}"

  # Install license, that is inside the readme file
  install -Dm644 README.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
