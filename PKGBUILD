# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-gitpython' 'python2-gitpython')
pkgver=2.1.3
pkgrel=7
pkgdesc="Python Git Library"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/GitPython"
license=('BSD')
_pkgname=GitPython
_pkgname2=gitpython
provides=("python-gitpython")
#conflicts=("python-gitpython")
install=
changelog=
noextract=()
# TODO: fix this ugly-ass shit.
# i.e. https://files.pythonhosted.org/packages/source/g/gitpython/${_name}-${pkgver}.tar.gz"
source=("https://files.pythonhosted.org/packages/source/g/${_pkgname2}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('918ff1765a85a818619165c2bcbb0d417f35c979c2f42f1bb7e41636696c0cb4d6837725f3655fbdfebea966476d1255ee18adabe9ed5536455b63336a1f399d'
            'SKIP')

package_python-gitpython() {
	depends=('python' 'python-gitdb2')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-gitpython() {
	depends=('python2' 'python2-gitdb2')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
