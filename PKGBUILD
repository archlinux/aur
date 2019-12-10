# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-pylibacl' 'python2-pylibacl')
pkgver=0.5.4
pkgrel=1
pkgdesc="A python extension module that allows you to manipulate the POSIX.1e ACLs. (Fixed for python 3)"
arch=( 'i686' 'x86_64' )
url="http://pylibacl.k1024.org/"
license=( 'LGPL' )
depends=( 'python' 'python2' )
makedepends=(  'python' 'python2' 'python-setuptools' 'python2-setuptools')
_pkgname=pylibacl
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/p/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('30fa9e8185c725ad44f1838dabe2f971a0d9556c7017208c30e1f472a6af5d5ce4da06d904d53dedd85ac30751d5ac7e6a9bf73b23618aae1135b64232e52d80'
            'SKIP')

package_python-pylibacl() {
	depends=('python')
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-pylibacl() {
	depends=('python2')
	conflicts=('pylibacl')
	provides=('pylibacl')
	pkgdesc="A python extension module that allows you to manipulate the POSIX.1e ACLs."
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}

