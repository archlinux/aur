# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgbase=python-pysmi
_pkgbase=${pkgbase/*-/}
pkgname=('python-pysmi' 'python2-pysmi')
pkgver=0.0.7
pkgrel=1
pkgdesc="A pure-Python implementation of SNMP/SMI MIB parsing and conversion library. Can produce PySNMP MIB modules."
url="https://sourceforge.net/projects/pysmi/"
arch=('any')
license=('BSD')
makedepends=('python' 'python2')
source=("http://pypi.python.org/packages/source/p/${_pkgbase}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('999f6db9e16f4cc2804263d825553dbdd188c4313ca5c1244eeb20a3c4a60116')

package_python-pysmi() {
  depends=('python-ply')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgdir}/LICENSE.txt"
}

package_python2-pysmi() {
  depends=('python2-ply')
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license
  install -D -m 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgdir}/LICENSE.txt"
  # Rename mibdump.py to mibdump2.py
  mv "${pkgdir}/usr/bin/mibdump.py" "${pkgdir}/usr/bin/mibdump2.py"
}
