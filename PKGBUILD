# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=sitegen
pkgname=${_pkgname}-bin
pkgdesc="Sitegen is a simple but flexible static site generator."

pkgver=1.0.37
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE.txt")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}_${_barch[1]}")
sha256sums=('e145baade9e2cedcac6f7cda256d7420de0d9f61cf4575a69bb6bfb5c1e10974'
            '1d9ea865074fbbf9c4fd61ee0b36ad684b69f8ed7c2d083464484ada5cac243c')
sha256sums_x86_64=('06263e83640d98cd2ec3637fe6d914012581dc8d6328b58d062219b6ed3bd32f')
sha256sums_aarch64=('f910100490d343cd0b765ac59d89c0cddcb56256bc86ad751900dec68fa77a52')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
