# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pixdeo
_gitname=editxr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Fast WYSIWYG Markdown Terminal Editor In Swift"

pkgver=1.9.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux-x86_64' 'linux-aarch64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.md"
		"LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_gitname}-${_gitversion}-${_barch[1]}.tar.gz")
sha256sums=('6c4a7c33afef4a15fabf7f4f7e5a219aee42d07f974ea72279a2c65aba60ebe3'
            'aa3c372eddbce231661a28c61fd4ba499d9bdad1f3a2abfab6a1d4863750de9b')
sha256sums_x86_64=('bbc4ff99e2ff36682c4ea794acee3b1ff4383c8b95f3b187bdcc9763f08b23d3')
sha256sums_aarch64=('1fd845b079154c9557f05d9350ef5a5bdafec13372936f7e0dc4497fe62f15f9')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
