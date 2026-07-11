# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=alikazai
_gitname=ktree
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Universal test runner with auto-detection for 11 languages"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

depends=('git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('8a2bd2794f4576518d6f72b1986ddb223cf8c2974c04bea16ab6f7820c3c078f')
sha256sums_aarch64=('d49753e146b2bcc07c6bd489e8d344d8981734cff14d8ddd9de205c0af8a2bff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
