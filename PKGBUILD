# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-mbed-manifest-tool
pkgname=('python-mbed-manifest-tool' 'python2-mbed-manifest-tool')
pkgver=1.5.2
pkgrel=1
pkgdesc='A tool for creating and parsing update manifests'
arch=('any')
url='https://github.com/ARMmbed/manifest-tool'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('30490a25c27902ba8dc8ffd306df1c6b4516e91b67f35aeaa38c4767e97da8b7')

package_python-mbed-manifest-tool() {
  depends=(
    'python'
    'python-asn1ate'
    'python-ecdsa'
    'python-cryptography'
    'python-future'
    'python-urllib3'
    'python-protobuf'
    'python-pyparsing'
    'python-colorama'
    'python-pyasn1'
  )

  cd "manifest-tool-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  python setup.py clean --all
}

package_python2-mbed-manifest-tool() {
  depends=(
    'python2'
    'python2-asn1ate'
    'python2-ecdsa'
    'python2-cryptography'
    'python2-future'
    'python2-urllib3'
    'python2-protobuf'
    'python2-pyparsing'
    'python2-colorama'
    'python2-pyasn1'
  )

  cd "manifest-tool-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
