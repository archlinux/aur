# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-manifest-tool
pkgver=2.1.0
pkgrel=2
pkgdesc='A tool for creating and parsing update manifests'
arch=('any')
url='https://github.com/ARMmbed/manifest-tool'
license=('Apache')
makedepends=('python-setuptools')
depends=(
  'python'
  'python-pyaml'
  'python-asn1ate'
  'python-cryptography'
  'python-jsonschema'
  'python-pyasn1'
  'python-urllib3'
  'python-mbed-cloud-sdk'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('90a9aabb349d1bb0bf6a3a9939faebdeaaefdd0753ef94c9ec6f22bc864c0dbe')

package() {
  cd "manifest-tool-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

# vim:set ts=2 sw=2 et:
