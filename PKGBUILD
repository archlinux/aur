# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=mehranzand
_gitname=repofleet
_appname=rf
pkgname=${_gitname}-bin
pkgdesc="An issue-centered CLI tool for organizing Git workflows"

pkgver=0.7.2
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
sha256sums_x86_64=('cfae765d5ab567ad623edcf48b63e7a166f1242ca7bdff07a09bfb8645d6ce66')
sha256sums_aarch64=('a20a1da77d6f07b6173ee47c3e08e821d15aa1a9237093ca5c512bcbe47c9412')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
