# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=('python-blkinfo' 'python2-blkinfo')
pkgver=0.1.2
pkgrel=2
pkgdesc="A python library to list information about all available or the specified block devices"
arch=('any')
url="https://github.com/grinrag/blkinfo"
license=('GPL3')
depends=('python' 'python2' 'util-linux')
_pkgname=blkinfo
install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/b/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('1fc84964e5b253dd2c179769499af996a622bd3f8a3ef5acce894c2f538597521f7f8f522dc2b1e69909bfc632f786714efe81eb9d7727442dc14ea67375b528'
            'SKIP')

package_python2-blkinfo() {
	depends=('python2' 'util-linux')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py install --root="${pkgdir}" --optimize=1
}

package_python-blkinfo() {
	depends=('python' 'util-linux')
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py install --root="${pkgdir}" --optimize=1
}
