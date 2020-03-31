# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-dpath
pkgver=2.0.1
pkgrel=2
pkgdesc="A python library for accessing and searching dictionaries via /slashed/paths ala xpath"
arch=('any')
url="https://pypi.org/project/dpath/"
license=( 'CUSTOM' )
depends=('python' 'python2')
makedepents=('python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname=dpath
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/d/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('4f4c2ccb91fe818127505e909c2021fec4ebf730d791ff12de720eddbb5c3f08f158e07f80332f7ab9450961a8eca92c51d9eba17fb3a3df2c34aee2dc655613'
            'SKIP')

package_python-pyrad() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README.rst ${pkgdir}/usr/share/doc/${pkgname}/README.rst
}

package_python2-pyrad() {
  depends=('python2' 'mdadm')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README.rst ${pkgdir}/usr/share/doc/${pkgname}/README.rst
}
