# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=p-arndt
_gitname=shenv
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="End-to-end encrypted .env sharing. Store anywhere, decrypt only with authorized teammates. No server needed."

pkgver=0.8.2
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
sha256sums=('e25ddae25d50b19740604caa46134ed31a48f0d15e87de7bbc9b28b3f59dee14')
sha256sums_x86_64=('db7ca1730a6f42af93d1909d226847de5d2443effbc5921c848ac080a81a0068')
sha256sums_aarch64=('d74a33dc33ac9f78b0b1e2a08a867cc2a55ab293482f11c4f927d8bd556659b9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
