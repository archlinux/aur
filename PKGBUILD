# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-manifest-tool
pkgname=('python-mbed-manifest-tool' 'python2-mbed-manifest-tool')
pkgver=2.0.0
pkgrel=1
pkgdesc='A tool for creating and parsing update manifests'
arch=('any')
url='https://github.com/ARMmbed/manifest-tool'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('47434d3ea7aa9e77baf7aba5f573ebe74d3c4de413f53afccc7fa6d07f7236fb')

package_python-mbed-manifest-tool() {
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

  cd "manifest-tool-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

package_python2-mbed-manifest-tool() {
  depends=(
    'python2'
    'python2-pyaml'
    'python2-asn1ate'
    'python2-cryptography'
    'python2-jsonschema'
    'python2-pyasn1'
    'python2-urllib3'
    'python2-mbed-cloud-sdk'
  )

  cd "manifest-tool-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
