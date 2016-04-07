# Maintainer: Konstantin Shalygin <k0ste@cn.ru>
# Contributor: Konstantin Shalygin <k0ste@cn.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='3.6.5.1'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://www.ovirt.org/develop/release-management/features/infra/python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-3.6-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d542a8227faadb536dee03b4f67d25123db4e13e3df2da525389f9f905df384c')

prepare() {
  pushd "${srcdir}/${pkgname}"
  sed -i 1d src/ovirtsdk/xml/params.py
  popd
}

build() {
  pushd "${srcdir}/${pkgname}"
  python2 setup.py build
  popd
}

package() {
  pushd "${srcdir}/${pkgname}"
  python2 setup.py install -O1 --skip-build --root ${pkgdir}
  popd
}
