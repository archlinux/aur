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
source=("http://resources.ovirt.org/pub/ovirt-4.0-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('dc3f5f0fb9e123a52ba6c9cf78bb84d9c8da5d0fae951648fc58b8c692bd4232')

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
