# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=abhixdd
_pkgname=ghgrab
pkgname=${_pkgname}-bin
pkgdesc="A simple, pretty terminal tool that lets you search and download files from GitHub without leaving your CLI"

pkgver=2.1.0
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux' 'linux-arm64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${pkgver}.md::${_urlraw}/README.md"
		"LICENSE-${pkgver}::${_urlraw}/LICENSE")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[0]}")
source_aarch64=("${_pkgname}-${arch[1]}-${pkgver}::${url}/releases/download/${_pkgvername}/${_pkgname}-${_barch[1]}")
sha256sums=('329d7a8593d654101bb6fd4772dce5b2d0b9b929b62e79ef950e464cecb859d0'
            '2447d1e56a881a12855aa080ed2fcb491b5c23a4dfb72a90c5e591df811615b0')
sha256sums_x86_64=('435ad8df609d3a715c880ce6dcbca31d720ebf1736540d8c52ea86155a06d334')
sha256sums_aarch64=('3daff212a98519cac7fabc992d95f8304ea1da5c3ffb480c4b66cb7484102a7a')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_pkgname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
