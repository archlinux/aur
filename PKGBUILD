# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=JoaoOliveira889
_gitname=monogit
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Multi-repo Git dashboard for your terminal"

pkgver=0.0.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('Linux_x86_64' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('f4a83d6179851a6ec0a727f269bbe27b2078e27f25a751ec1ba8d2ad5a7b6913')
sha256sums_aarch64=('9ec02e4d2ca3a4bb02636611a70520f1df9eeaa28194d2de322e6f50c917d0ca')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
