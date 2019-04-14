
# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-validators
pkgver=0.12.4
pkgrel=1
pkgdesc="Python data validation for humans"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/validators"
license=( 'custom' )
depends=( 'python' 'python-decorator' )
makedepends=('python' 'python-setuptools')
_pkgname=validators

install=
changelog=
noextract=()
source=("https://files.pythonhosted.org/packages/source/v/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        "${_pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('bf900c6d33f170a3fe30ffcdbc24aef2d7803545cb076264c48ab33e40ae068ef649ea5d8025548abdf9723387ed89e5b5c23de4ef376fa2306da55504145e11'
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
