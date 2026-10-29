# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=utkarsh261
_gitname=pho
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI for Github Pull Requests"

pkgver=1.0.6
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('GPL-3.0')

depends=('github-cli')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('5e0e2095f0ae5673b18a52633e9e2725fa246991c31ebc6a1b896253d51c79b6')
sha256sums_aarch64=('dcf0e06040bbba0b28484b8a2417c8bb6c4e1f0c7d4acf3c5054cd00a390ebb0')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
