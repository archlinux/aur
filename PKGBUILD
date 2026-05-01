# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=simonwhitaker
_gitname=runny
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A tool for running things"

pkgver=0.2.1
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'i686' 'aarch64')
_barch=('Linux_x86_64' 'Linux_i386' 'Linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('LicenseRef-UNLICENSE')

depends=('bash')
provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_i686=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
source_aarch64=("${_appname}-${arch[2]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[2]}.tar.gz")
sha256sums=('cc8eee50aa319de86bd79b0ca4d5a5e08abc288f805cf31ab7675851d3df0c99')
sha256sums_x86_64=('05dfb01f9ab743a8485d4784e5a2f3aae6ea1e6b3ef9cc3a9a011e5899b84685')
sha256sums_i686=('ac2f18c0716d098f0cb2fb4053af4c6ce398da3c06c569f76530f8c0b9de386c')
sha256sums_aarch64=('85940703395967fba287eb3df5c4e26c73f9ab34c090d798dcbc5e2ec03f9da5')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	# install -D -m644 "completions/${_appname}.bash" "${pkgdir}/usr/share/bash-completion/completions/${_appname}"
	# install -D -m644 "completions/${_appname}.zsh" "${pkgdir}/usr/share/zsh/site-functions/_${_appname}"
	# install -D -m644 "completions/${_appname}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${_appname}.fish"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

