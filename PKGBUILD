# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=boolean-maybe
_pkgname=tiki
pkgname=${_pkgname}-bin
pkgdesc="Markdown-based git-versioned documentation and issue management"

pkgver=0.5.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('Apache-2.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('378c636783f8f17fce6b77bffebbb05ea3d4f2ef3a4f4756da1a9e2828bf08fd')
sha256sums_aarch64=('a7256af0f565ee46d91075735c7507dcc1b469ee2a7c595fe96b251f10b08bd5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
