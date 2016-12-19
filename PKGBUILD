# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgname=python2-pyroute2
pkgver=0.4.4
pkgrel=1
pkgdesc="A pure Python netlink and Linux network configuration library. (Python 2 version)"
arch=(any)
url="http://docs.pyroute2.org/"
license=('GPL')
depends=('python2')
makedepends=('python2-setuptools')
options=(!emptydirs)
source=("https://pypi.io/packages/source/p/pyroute2/pyroute2-0.4.4.tar.gz")
sha256sums=('794cafb9f1b7fe9f2d74be888b6cd3093a6fc2fb727fa0537319f906f9f196b8')

package() {
  cd "${srcdir}/pyroute2-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -v -m755 -d "${pkgdir}/usr/share/doc/python2-pyroute2"
  install -v -m644 README.md "${pkgdir}/usr/share/doc/python2-pyroute2/"
  cp -rf docs/html "${pkgdir}/usr/share/doc/python2-pyroute2/"
}


