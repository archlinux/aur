# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ralsina
_pkgname=crycco
pkgname=${_pkgname}-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="A literate programming tool"
arch=('x86_64' 'aarch64')
_barch=('amd64' 'arm64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[0]}")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-static-linux-${_barch[1]}")
sha256sums=('91c5a6fc53adf00971f7b4851ae27b91291e470a67f2474d00c965d05dc7d286'
            'b7e334c1513c7a4a24332179ad3a63043fc2f65d36e71a4a7a01eb8bb9e522d6'
            'aa413d528825c2b382ae835c234e1c9f766e1adb04856bc0b5312769a6ff106c')
sha256sums_x86_64=('cd893d93170b3ff476fd47dc73b11efbcc19409e11a57a660493da2c89772ff8')
sha256sums_aarch64=('3016a160f7569d0a0747065134900c6812d6dc0068cc76cd65f434429c328b0f')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-static-linux-"* "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"
}
