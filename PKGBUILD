# Maintainer: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>

pkgbase=python-virustotal-api
_pyname=virustotal-api
pkgname=('python-virustotal-api' 'python2-virustotal-api')
pkgver=1.1.2
pkgrel=2
pkgdesc="Virus Total Public/Private/Intel API"
arch=('any')
url="https://github.com/blacktop/virustotal-api/"
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools' 'python-future' 'python2-future')
source=("${_pyname}-${pkgver}.tar.gz::https://pypi.python.org/packages/source/v/${_pyname}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('ed687b1b75532d23489bc9a9dffc99e60ee041fd3e87740e5738c0c274af31fad92e8de06560961f15e3a617cb896d0a2749c4f125ff5257c19e01595f1f3d0e')

prepare() {
  cd "${srcdir}"
  cp -r virustotal-api-"${pkgver}" virustotal-api2-"${pkgver}"
}

# currently disabled because of missing files
#check() {
#  cd "${srcdir}/virustotal-api-${pkgver}"
#  python setup.py test
#
#  cd "${srcdir}/virustotal-api2-${pkgver}"
#  python2 setup.py test
#}

package_python-virustotal-api() {
  depends=('python' 'python-future' 'python-requests')
  cd "${srcdir}/virustotal-api-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}

package_python2-virustotal-api() {
  depends=('python2' 'python2-future' 'python2-requests')
  cd "${srcdir}/virustotal-api2-${pkgver}"
  python2 setup.py install --root "${pkgdir}" --optimize=1
}

# vim:set et sw=2 ts=2 tw=79:
