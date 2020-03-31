# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-pyrad' 'python2-pyrad')
pkgver=2.3
pkgrel=1
pkgdesc="Python RADIUS Implementation"
arch=('any')
url="https://pypi.org/project/pyrad/"
license=('CUSTOM')
depends=('python' 'python2')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname=pyrad
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('a3703a6c1cb79735e8c55656e6472461504b4e8cf493caa69cb088e17f8f442184c51123a81ac42a8d94f439bcb164a230da91a377175eb1d35b979055e37359'
            'SKIP')

package_python-pyrad() {
  depends=('python')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README.rst ${pkgdir}/usr/share/doc/${pkgname}/README.rst
}

package_python2-pyrad() {
  depends=('python2')

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt
  install -D -m644 ${srcdir}/${_pkgname}-${pkgver}/README.rst ${pkgdir}/usr/share/doc/${pkgname}/README.rst
}
