# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pixdeo
_gitname=editxr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Fast WYSIWYG Markdown Terminal Editor In Swift"

pkgver=1.4.0
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
sha256sums=('31d6ecf4aeda17513970a916f33d2528f85a26a0396fdffc3ca0ae57e4beec85'
            'aa3c372eddbce231661a28c61fd4ba499d9bdad1f3a2abfab6a1d4863750de9b')
sha256sums_x86_64=('ef98ab9d79a6df4d972aadd866d72f801bf580cd3e3895ff49c7967470c7d47f')
sha256sums_aarch64=('7875ab7e7c237310dee1afb3dbff8c8e7fbe70ca497a0a06c326a4765981e3a7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
