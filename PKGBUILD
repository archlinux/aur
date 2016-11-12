# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=python-gitpython
pkgver=2.1.0
pkgrel=2
pkgdesc="Python Git Library"
arch=('i686' 'x86_64')
url="https://pypi.python.org/pypi/GitPython"
license=('BSD')
depends=('python' 'python-gitdb')
_pkgname=GitPython
provides=("python-gitpython")
#conflicts=("python-gitpython")
install=
changelog=
noextract=()
# TODO: fix this ugly-ass shit.
source=("https://pypi.python.org/packages/d7/16/e914d345d7d4e988f9196b9719a99220bad6a5dbd636162f9b5cc35f3bd6/GitPython-2.1.0.tar.gz"
        "GitPython-2.1.0.tar.gz.sig")
sha512sums=('118656fc9ec15883090f1a88d9de65834ef841acb757adcde92bea6de3f504bdb49467307d42c905be83606310431e1d5672af073dd49e730210d648b4045201'
            'SKIP')
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py build || return 1
}
package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
