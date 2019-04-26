# Maintainer: Mikhail felixoid Shiryaev mr<dot>felixoid<at>gmail<dot>com

_name=adminapi
_srcname=serveradmin
pkgbase="python-${_name}"
pkgname=("python-${_name}" "python2-${_name}")
pkgver=1.4.3
pkgrel=1
pkgdesc='Adminapi is a python module which can be used to talk to the open source serveradmin project by Innogames'
arch=('any')
url="https://github.com/InnoGames/${_srcname}"
makedepends=('python-setuptools' 'python2-setuptools')
license=('MIT')
source=("${_srcname}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('050da40183d1d3ade1016aaf012655f28253dfa335d37ead44df0d6b0535dd7b')


package_python2-adminapi() {
  depends=('python2' 'python2-ipaddress' 'python2-netaddr')
  conflicts=("python2-${_name}-git")
  cd "${srcdir}/${_srcname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}/usr/bin/${_name}"  "${pkgdir}/usr/bin/${_name}2"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}

package_python-adminapi() {
  depends=('python' 'python-ipaddress' 'python-netaddr')
  conflicts=("python-${_name}-git")
  cd "${srcdir}/${_srcname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"LICENSE
}
