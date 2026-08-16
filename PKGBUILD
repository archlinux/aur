# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=alikazai
_gitname=ktree
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A terminal UI for managing git worktrees"

pkgver=0.3.1
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
sha256sums_x86_64=('c2f123d1761c396cc28721eab0d0a7dd89cb9be9f1e7e38ac0b7753932927f0e')
sha256sums_aarch64=('ba8cfcbcdc7b111426cd672b28815a1418c34caea83ba15421ae846df20b6a1b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
