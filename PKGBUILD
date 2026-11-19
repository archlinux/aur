# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=altlimit
_pkgname=sitegen
pkgname=${_pkgname}-bin
pkgdesc="Sitegen is a simple but flexible static site generator."

pkgver=1.0.40
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
sha256sums=('5a3ac28193aff29ba74349f33bd2cd5b4b25c1ea87c1ebe61c09c7c095e73ccb'
            '1d9ea865074fbbf9c4fd61ee0b36ad684b69f8ed7c2d083464484ada5cac243c')
sha256sums_x86_64=('812f6155ed66df42b13492b76ea15058f65f1bdd7edbb28e228c824b7a081ab7')
sha256sums_aarch64=('afc3c50198df64a96e86a554b464c6447e03b6c3a7cf80b504afc911c4c57cf5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
