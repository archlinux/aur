# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-zconfig
pkgver=3.1.0
pkgrel=1
pkgdesc="Structured configuration library for python3"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/ZConfig"
license=('GPL')
depends=('python')
_pkgname=ZConfig
provides=("python-zconfig")
#conflicts=("python-zconfig")
install=
changelog=
noextract=()
source=("http://pypi.python.org/packages/source/Z/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('797be70d29f97104318cd53f3e61a02a21d5c356ee0a09ef77cdb113445b404bf6a9c089dea9ded6645b663c7f54ea2859b29602c88b24f573ea1b70422250c1'
            'SKIP')
build() {
        cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py build || return 1
}
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
