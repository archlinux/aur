# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='ovirt-engine-sdk'
pkgname=('python-ovirt-engine-sdk' 'python2-ovirt-engine-sdk')
pkgver='4.1.3'
pkgrel='1'
pkgdesc='The oVirt Python SDK is a Python package that simplyfies access to the oVirt Engine API.'
arch=('any')
url='http://ovirt.org/develop/release-management/features/infra/python-sdk'
makedepends=('python-setuptools'
	     'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-4.1/src/python-${pkgbase}4/${pkgbase}-python-${pkgver}.tar.gz")
sha256sums=('6bfa15e793117c33c134cdcfe68b86ccb5bd094b3ef09a9982a627a66cf16b54')

package_python-ovirt-engine-sdk() {
  depends=('python-pycurl' 'python-six')

  cd "${srcdir}/${pkgbase}-python-${pkgver}"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-ovirt-engine-sdk() {
  depends=('python2-pycurl' 'python2-six' 'python2-enum34')

  cd "${srcdir}/${pkgbase}-python-${pkgver}"
  python2 setup.py install -O1 --root="${pkgdir}"
}
