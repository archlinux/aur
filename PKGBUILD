# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-menu
pkgver=2.0
pkgrel=2
pkgdesc="Easily create commandline menus in python applications"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/Menu"
license=('GPL')
_pkgname=Menu
provides=("python-menu")
depends=("python2")
#conflicts=("python-menu")
install=
changelog=
noextract=()
source=("http://pypi.python.org/packages/source/M/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('0bb2e2b93e9e19cc0c768bd68b0f848dedb665118a836cb1c56b5130e0cd45f29caf5415a74c2b96f6e91a3c415eb4da09aa6624d65f01f7eaa4a3634483d798'
            'SKIP')
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
        python2 setup.py build || return 1
}
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
