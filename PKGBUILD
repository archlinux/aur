# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=gitsocial-org
_gitname=gitsocial
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Git-native cross-forge collaboration: posts, issues, PRs, releases, all in your repo"

pkgver=0.10.3
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url='https://gitsocial.org/'

license=('MIT')

depends=('glibc' 'git')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('5f846d6b6b4bff8549ae5030fe3273ca7ab902cbde1e11633c89f86c0abaf3ca')
sha256sums_aarch64=('fd3f5d03efc98439eac06c435d2f95ac51d13d967e524bd7f59be43deedd5b6b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
