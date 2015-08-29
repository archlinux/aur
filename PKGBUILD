# Maintainer: Konstantin Shalygin (k0ste@cn.ru)

pkgname='ovirt-engine-sdk-python'
pkgver='4.0.0.0'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://www.ovirt.org/Python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-master-snapshot/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("f60be15681ea0e51100f3ef0d14294622e971ba6d8ab900228cbd0d6f1982ba2")

prepare() {
  cd "${srcdir}/${pkgname}"
  sed -i 1d src/ovirtsdk/xml/params.py
}

build() {
  cd "${srcdir}/${pkgname}"
  /usr/bin/python2 setup.py build
}

package() {
  pushd "${srcdir}/${pkgname}"
  /usr/bin/python2 setup.py install -O1 --skip-build --root ${pkgdir}
  popd
}
