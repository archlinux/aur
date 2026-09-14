# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=kenn-io
_pkgname=agentsview
pkgname=${_pkgname}-bin
pkgdesc="A local-first desktop and web application for browsing, searching, and analyzing AI agent coding sessions. Supports Claude Code, Codex, Gemini, OpenCode, Copilot and many other agents."

pkgver=0.43.0
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
sha256sums=('95ee6f691c3d2febed6e232761c028653162f78680757eb20f80227752c01850'
            'ffb1006bf3c32ec8da3ad6c5f693d8516eecb355df848a694332fa13174a77d4')
sha256sums_x86_64=('4520c6698772d2db7220212abf58d7d58c0966d7435f0a5ab134371f874df6d9')
sha256sums_aarch64=('3c4141bc1356058246336ea8b49a2c846f3050e9a199aa8f732c8815c2dd4e50')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
