# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=0xjuanma
_pkgname=golazo
pkgname=${_pkgname}-bin
pkgver=0.6.0
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
            '2069e87485eaa5b66e7a4c5b715d41c4081941437d9094d9bbd3a4785c5806a3')
sha256sums_x86_64=('3835c590714576f04de42912cc7f6f8f466ef00b07e7d9d1e2854afbde3cba6a')
sha256sums_aarch64=('2f408ec5920db1fc5d7da959fe4725a61c1cc8e9f4a5c11a8566e1507d266a02')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
