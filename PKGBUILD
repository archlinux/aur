# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mehranzand
_gitname=repofleet
_appname=rf
pkgname=${_gitname}-bin
pkgdesc="An issue-centered CLI tool for organizing Git workflows"

pkgver=0.7.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

depends=('git')
provides=("${_appname}")
conflicts=("${pkgname%%-bin}")

options=('!strip')

source_x86_64=("${_gitname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_barch[0]}.tar.gz")
source_aarch64=("${_gitname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('6b17570a96e82e18f1c4807eb63de688f7b1c7d1105150616b19676f0438ed08')
sha256sums_aarch64=('3d748966a5ac913b25a37855ba363df087d6e5a3812331a6b6953ed81ba6df3c')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
