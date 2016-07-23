# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='3.6.8.1'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://ovirt.org/develop/release-management/features/infra/python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('5f091159abca5a385c0047721b13c0b3b4bf741ac2c22ace511bf7bdb76307d4')

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
