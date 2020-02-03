# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-snakeoil
pkgver=0.8.7
pkgrel=4
pkgdesc="Provides common functionality and useful optimizations"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/snakeoil"
license=('BSD' )
depends=( 'python' )
makedepends=( 'python' 'python-setuptools' )
_pkgname=snakeoil

install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/s/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('010bbaa08f84ce59f20324ae86af4ad71c167442557934e31fc2040e3ced8d2ce0f1657272057d06e9fd1c22fd8ec89ad3233f24443ace4861121319f2772679'
            'SKIP')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
        python3 setup.py build || return 1
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	python3 setup.py install --root="${pkgdir}" --optimize=1 || return 1
	install -D -m 0644 ${srcdir}/${_pkgname}-${pkgver}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
