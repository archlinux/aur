# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=m7b-io
_gitname=snav
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Fast terminal code navigator with fuzzy search, syntax-highlighted preview and editor integration, powered by ripgrep"

pkgver=0.7.4
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

depends=('ripgrep')

options=('!strip')

source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${pkgver}_${_barch[1]}.tar.gz")
sha256sums_x86_64=('1d98ee4c153752367f1bbb0e2b24dbaf25e19e5b598453239c26384ff5ae97d4')
sha256sums_aarch64=('198b0e1a56a67e9522872e51fcf076185e370dba7c010a598576740bf77b6b16')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
