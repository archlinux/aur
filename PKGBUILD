
# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')

# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net

pkgname=python-validators
pkgver=0.11.1
pkgrel=2
pkgdesc="Python data validation for humans"
arch=( 'i686' 'x86_64' )
url="https://pypi.python.org/pypi/validators"
license=( 'custom' )
depends=( 'python' )
makedepends=( 'python' )
_pkgname=validators

install=
changelog=
noextract=()
source=("https://pypi.python.org/packages/40/55/dc3a142cd5d696a0652abb98ac8abf0f83c6a272b57021f24ee5a142ab88/validators-0.11.1.tar.gz"
        "validators-0.11.1.tar.gz.sig")
sha512sums=('7b342568eda3629f3b6e62983814702f1d2e0335f5b4e717f8ecbfd235c8084ffa8d028491d5b86dcfdb85be6a4a66104807137d66e271d2cddb8b3a80e8e31e'
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
