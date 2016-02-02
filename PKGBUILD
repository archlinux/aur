# Maintainer: Konstantin Shalygin <k0ste@cn.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='4.0.0.0'
pkgrel='3'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://www.ovirt.org/Python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('c80ad007d1e9e3983455dba883a4c27eaf4cbf7405fbc3dc5a381bdd5bd997ea')

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
