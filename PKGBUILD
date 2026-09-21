# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=pixdeo
_gitname=editxr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="A Fast WYSIWYG Markdown Terminal Editor In Swift"

pkgver=1.8.0
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
sha256sums=('eed649de256e6c24ce40ec915a75707ee2fea261c12736f814cba134bda0b115'
            'aa3c372eddbce231661a28c61fd4ba499d9bdad1f3a2abfab6a1d4863750de9b')
sha256sums_x86_64=('18a4f0551d0504e45aafbf08613cd10b089d3cda8983c32153bb94fd31a26700')
sha256sums_aarch64=('bc7b45d9d89c229541a3b5aa1ce0a0c1477b0440115a2ac648c83a2f8ecec5e7')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
