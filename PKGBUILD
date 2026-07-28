# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=agentsview
pkgname=${_pkgname}-bin
pkgdesc="A local-first desktop and web application for browsing, searching, and analyzing AI agent coding sessions. Supports Claude Code, Codex, Gemini, OpenCode, Copilot and many other agents."

pkgver=0.39.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc' 'libstdc++')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}.tgz::${url}/releases/download/${_pkgvername}/${_pkgname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('584192e035c78dd6931c61cfb271c8a6e7ee5f709b6d02bf791f456783d5a8f8'
            'ffb1006bf3c32ec8da3ad6c5f693d8516eecb355df848a694332fa13174a77d4')
sha256sums_x86_64=('c71e4ed030adba6cc418e099328e3f44a4232bccc7317ccc3408182542262387')
sha256sums_aarch64=('7e03146eafdc89732ddca8609c6ef1bb4ec1466701652a8ead49c25942f77355')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
