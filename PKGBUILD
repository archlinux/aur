# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=wesm
_pkgname=agentsview
pkgname=${_pkgname}-bin
pkgdesc="A local-first desktop and web application for browsing, searching, and analyzing AI agent coding sessions. Supports Claude Code, Codex, Gemini, OpenCode, Copilot and many other agents."

pkgver=0.18.0
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
sha256sums=('8f45901e317571f12197f7d296f9bd559c3da7b2298e70cae34d05b43501232c'
            '2ed631eaa533f3ff8864e6deab7ae8a62afe0a386f5c7629e5e2a60d4d02e288')
sha256sums_x86_64=('088b4696289d7fd1eb84f59d79c97db335df738825e51f2761083a853617b9c3')
sha256sums_aarch64=('60cefb88f6ab3d7f857656d2a81b3ffb6a523dca942c7ef04ca4b090f9783e4d')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
