# Maintainer:  Michael (https://aur.archlinux.org/account/michael_wzq)
pkgname=nodejs-utf8-byte-length
_pkgname=${pkgname#nodejs-}
pkgver=1.0.5
pkgrel=1
pkgdesc='Get the utf8 byte length of a string, taking into account multi-byte characters and surrogate pairs.'
url='https://github.com/parshap/utf8-byte-length#readme'
license=('WTFPL OR MIT')
arch=('any')
makedepends=('npm')
source=("https://registry.npmjs.org/$_pkgname/-/$_pkgname-$pkgver.tgz")
#noextract=("${_pkgname}-${pkgver}.tgz")
b2sums=('389881e234f5b3b8394b28aa89a01d7f33794cd6085c066255e21fe218348f5b186ec15729e78a61def672b66504a1359ed64c2e16f4486b8f661bf6d6d0fcb4')

package() {
	npm install --offline -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname#types-}-${pkgver}.tgz"

	install -Dm644 "${srcdir}/package/LICENSE.MIT.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "${srcdir}/package/LICENSE.WTFPL.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
