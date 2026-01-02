# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.9.0
_pkgvername=v${pkgver}
pkgrel=1
pkgdesc="Terminal app for keeping up with live football. Check scores, match events, and stats from major leagues without leaving your terminal"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"
license=('Apache-2.0')

depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-linux-${_barch[1]}")
sha256sums=('4dc0a5daa325b37f64f50f726db4dd94342dcfec49bd0fe80266a0ef59953bfa'
            'c1cb93badcb28a7ce425e9c51a76219dd4d0f480ca005205973ec0a55d165a41')
sha256sums_x86_64=('b870948f3713ec925e0aed8eacc838c8e675170c24b14a7c93be4d89725b8b44')
sha256sums_aarch64=('19aa4dc9cf4087530aa83833b2f3659fa4c62d5ed690fa9e2d6ed1a589035d9b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
