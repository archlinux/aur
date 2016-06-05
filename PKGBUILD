# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='3.6.5.2'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://www.ovirt.org/develop/release-management/features/infra/python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-4.0-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('a68d3c5ae908c73a196a23eb1cd2f57b4f30d28f2bbce3692a2957f53923f818')

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
