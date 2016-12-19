# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python2-pyroute2
pkgver=0.4.5
pkgrel=1
pkgdesc="A pure Python netlink and Linux network configuration library. (Python 2 version)"
arch=(any)
url="http://docs.pyroute2.org/"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/pyroute2/pyroute2-${pkgver}.tar.gz")
sha256sums=('d80c83fcbb6385bf126d69345cabce01d0fbb870b6ad46dd4583e6c54e775061')

package() {
  cd "${srcdir}/pyroute2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-pyroute2"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python2-pyroute2/"
  cp -rf docs/html "${pkgdir}/usr/share/doc/python2-pyroute2/"
}


