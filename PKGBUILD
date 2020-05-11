# Maintainer: Lorenzo Cappelletti <lorenzo.cappelletti gmail.com>

pkgbase=python-asn1ate
pkgname=('python-asn1ate' 'python2-asn1ate')
pkgver=0.6
pkgrel=1
pkgdesc='A Python library for translating ASN.1 into other forms'
arch=('any')
url='https://github.com/kimgr/asn1ate'
license=('custom:Schneider Electric Building AB')
makedepends=('python-setuptools' 'python2-setuptools')
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('49f4bddefa350feaa305e1dedb0ca7780ffcb1e273810aec124b66ca5c4fa579')

package_python-asn1ate() {
  depends=(
    'python'
    'python-pyasn1'
    'python-pyparsing'
  )

  cd "asn1ate-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  python setup.py clean --all
}

package_python2-asn1ate() {
  depends=(
    'python2'
    'python2-pyasn1'
    'python2-pyparsing'
  )

  cd "asn1ate-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  python2 setup.py clean --all
}

# vim:set ts=2 sw=2 et:
