# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=p-arndt
_gitname=shenv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="End-to-end encrypted .env sharing. Store anywhere, decrypt only with authorized teammates. No server needed."

pkgver=0.8.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums=('62e3a5f96a19fbedc00f7173057c4d5161b96cc36015a5091a1345f6b005652f')
sha256sums_x86_64=('d92362af59bf05918adcfe562bbab261581b3aa13d8f4a99e973fbbb3b48ce5f')
sha256sums_aarch64=('8b6d5616e96a06fc8c3a0339f1f12c851f7de6469ac474c505bdc22256c09595')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
