# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgbase=pdb-clone
pkgname=('python-pdb-clone' 'python2-pdb-clone')
pkgver=1.10
pkgrel=1
pkgdesc="Clone of pdb, fast and with the remote debugging and attach features"
url="https://code.google.com/p/pdb-clone"
arch=('any')
license=('GPL2')
source=(https://pypi.python.org/packages/source/p/${pkgbase}/${pkgbase}-${pkgver}.tar.gz)
sha512sums=('22b091368750c12e3d766434c5bf21722b99f1dcb3588d6085edb320a6c3f4f35d8297d2b8a90fbd1e9d1abf9858448a45e1fa07e247978da4f42b176d50f460')

package_python-pdb-clone() {
  depends=('python')

  cd ${pkgbase}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-pdb-clone() {
  depends=('python2')

  cd ${pkgbase}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/bin/pdb-clone" "${pkgdir}/usr/bin/pdb-clone2"
  mv "${pkgdir}/usr/bin/pdb-attach" "${pkgdir}/usr/bin/pdb-attach2"
}

# vim: ts=2 sw=2 et:
