# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='3.6.9.2'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://ovirt.org/develop/release-management/features/infra/python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('7d1e8f6b9352d4a9d1b3c9a0b26af3b99650c6a1da6406182236c67cf142f07b')

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 1d src/ovirtsdk/xml/params.py
}

build() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install -O1 --skip-build --root="${pkgdir}"
}
