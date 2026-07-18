# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=chaiops
_gitname=llm-arch
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="TUI for exploring LLM architecture from safetensors and GGUF checkpoints"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('Unlincense')

provides=("${_appname}")
conflicts=("${pkgname%-bin}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('c9d0afd9e7622ef997fa9e08e01353d58470588b6bd4578edb99ad0198f03879')
sha256sums_x86_64=('fea1cdebb7069c29220389a2c46b999e85ed160097c6ad6627cd9f4ec99927dd')
sha256sums_aarch64=('9909717cfb086b4c4e9c6aae0da61626dcf9c138067cd2a32164d2b79f476f68')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
