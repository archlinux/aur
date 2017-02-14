# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-gitpython' 'python2-gitpython')
pkgver=2.1.1
pkgrel=5
pkgdesc="Python Git Library"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/GitPython"
license=('BSD')
_pkgname=GitPython
provides=("python-gitpython")
#conflicts=("python-gitpython")
install=
changelog=
noextract=()
# TODO: fix this ugly-ass shit.
# i.e. https://files.pythonhosted.org/packages/source/g/gitpython/${_name}-${pkgver}.tar.gz"
source=("https://pypi.python.org/packages/21/13/8d0981cee1c5b9dd7fa9f836ed7c304891686f300572c03a49e52c07c04c/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('b9f49e0c23501926647c41dd386865d0bc79eae9bb4789b12a6d5ef74d57121f4953aef55a46d324d1be9d6d01f8f087f86bdf353137ac2e3027c81da81f1fb1'
            'SKIP')

package_python-gitpython() {
	depends=('python' 'python-gitdb2')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py build || return 1
	python setup.py install --skip-build --root="${pkgdir}" --optimize=1 || return 1
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-gitpython() {
	depends=('python2' 'python2-gitdb2')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py build || return 1
	python2 setup.py install --skip-build --root="${pkgdir}" --optimize=1 || return 1
	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
