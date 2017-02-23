# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgbase='ovirt-engine-sdk'
pkgname=('python-ovirt-engine-sdk' 'python2-ovirt-engine-sdk')
pkgver='4.1.0'
pkgrel='1'
pkgdesc='The oVirt Python SDK is a Python package that simplyfies access to the oVirt Engine API.'
arch=('any')
url='http://ovirt.org/develop/release-management/features/infra/python-sdk'
makedepends=('python-setuptools'
	     'python2-setuptools')
license=('ASL 2.0')
source=("https://github.com/oVirt/${pkgbase}/archive/${pkgver}.tar.gz")
sha256sums=('aca1adffd569a757a8379bd69f4055efcf5b391c9b149587e1dd0f2021578905')

package_python-ovirt-engine-sdk() {
  depends=('python-pycurl' 'python-six')

  cd "${srcdir}/${pkgbase}-${pkgver}/sdk"
  python setup.py install -O1 --root="${pkgdir}"
}

package_python2-ovirt-engine-sdk() {
  depends=('python2-pycurl' 'python2-six' 'python2-enum34')

  cd "${srcdir}/${pkgbase}-${pkgver}/sdk"
  python2 setup.py install -O1 --root="${pkgdir}"
}
