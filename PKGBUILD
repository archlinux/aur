# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=padovanl
_gitname=portop
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🔌 What's really using your ports? htop-style TUI, one keypress to kill it"

pkgver=0.0.5
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('d957e8de207e0343a1eb314b2fc62bf3c4d692ea79da1d308ba4f647abcdaba1')
sha256sums_aarch64=('aa647a942f8aa59809719dce6c1f05740fa42e4cbe6dd3819aab769475f3a765')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
