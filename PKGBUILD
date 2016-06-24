# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='ovirt-engine-sdk-python'
pkgver='3.6.7.0'
pkgrel='1'
pkgdesc='oVirt Engine Software Development Kit (Python)'
arch=('any')
url='http://www.ovirt.org/develop/release-management/features/infra/python-sdk'
depends=('python2' 'python2-lxml' 'python2-pycurl')
makedepends=('python2' 'python2-setuptools')
license=('ASL 2.0')
source=("http://resources.ovirt.org/pub/ovirt-4.0/src/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('29e2f00f8b56c98698557b5032f47e641d3c482ef9596b16fff4d799f6943318')

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
