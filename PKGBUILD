# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pixdeo
_gitname=editxr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Fast WYSIWYG Markdown Terminal Editor In Swift"

pkgver=1.6.3
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
sha256sums=('cc0d96389dd06da70e2c9fc34a273a50f740edfbabbb6aa4e37d6a548d9624bc'
            'aa3c372eddbce231661a28c61fd4ba499d9bdad1f3a2abfab6a1d4863750de9b')
sha256sums_x86_64=('f1bb1b6e3005f578fac4cec4b21873870ff2b68334688835dbf0e7aa8828a015')
sha256sums_aarch64=('f385a83791303a0a544904a8801da88857c2251ea8b523ddd8703ec6b03d57b8')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
