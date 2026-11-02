# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pixdeo
_gitname=editxr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Fast WYSIWYG Markdown Terminal Editor In Swift"

pkgver=1.9.3
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
sha256sums=('eecbf15187d7cb18b40ec634ae534c491834f1d3d35e060aef6bd77c67045488'
            'aa3c372eddbce231661a28c61fd4ba499d9bdad1f3a2abfab6a1d4863750de9b')
sha256sums_x86_64=('cd074a250901fff894a9aebfe6d3f0ef7100919bfa5a7e7ddf7cc45c1367280a')
sha256sums_aarch64=('5902e76fbc8e5754c6c6a6e4741292acae5ef1cd7ece35a5c47d21d867ee8a19')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
