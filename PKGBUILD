# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-application
_pkgver=release-3.0.4
pkgname=python-application
pkgver=3.0.4
pkgrel=1
pkgdesc="Basic building blocks for Python applications"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-application"
makedepends=('python-setuptools')
depends=('python' 'python-zope-interface')
conflicts=('python3-application')
provides=('python3-application')
replaces=('python3-application')
source=("https://github.com/AGProjects/${_pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('1a5aa058953aab6c32202fbaa916935424f91fd07b709c5cdcb15904e2c1539359057265afbcf31e7a41be61cd543d372cb1d6fbe5b13598fcbc4334029b7126')

prepare() {
  cd "${_pkgname}-${_pkgver}"
}

build() {
  cd "${_pkgname}-${_pkgver}"
  python3 setup.py build
}

package() {
  cd "${_pkgname}-${_pkgver}"
  python3 setup.py install --root="$pkgdir/" --optimize=1 --skip-build

  # license
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
