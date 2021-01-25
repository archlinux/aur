# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgname=python-mbed-manifest-tool
pkgver=2.1.1
pkgrel=2
pkgdesc='A tool for creating and parsing update manifests'
arch=('any')
url='https://github.com/ARMmbed/manifest-tool'
license=('Apache')
makedepends=('python-setuptools')
depends=(
  'python>=3.6'
  'python-pyaml'
  'python-asn1ate'
  'python-cryptography'
  'python-jsonschema'
  'python-pyasn1'
  'python-urllib3'
  'python-mbed-cloud-sdk'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('34e5d377ec9ea61afb14ef363f7f0a46b7bd167647fc842b0ef18891ca1dad4f')

package() {
  cd "manifest-tool-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

# vim:set ts=2 sw=2 et:
