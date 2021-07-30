# Maintainer: Franco Masotti <franco dot masotti at live dot com>
# Contributor: Franco Masotti <franco dot masotti at live dot com>
pkgname=python-fpyutils
pkgver=2.0.1
pkgrel=1
pkgdesc="A collection of useful non-standard Python functions which aim to be simple to use"
arch=('any')
url="https://blog.franco.net.eu.org/software/#fpyutils"
license=('GPL3')
depends=('python' 'python-atomicwrites=1.4.0' 'python-yaml=5.4.1.1' 'python-requests=2.26.0')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz.sig" "https://blog.franco.net.eu.org/software/fpyutils-${pkgver}/fpyutils-${pkgver}.tar.gz")
sha512sums=('SKIP' '5d11ed532b321b383dbaed8adbecd5686b1acbf2da25ff05b599b0312ebad64bffe2f83f71a291ecdd81472116de01589fbbc59dd6f4a102d0d442e360849f41')

check() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python -m unittest discover --failfast --locals --verbose
}

package() {
  cd "${srcdir}"/fpyutils-"${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}
