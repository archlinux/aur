# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=iRootPro
_gitname=rdr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal RSS/Atom feed reader built with Go"

pkgver=0.11.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64' 'aarch64')
_barch=('linux_amd64' 'linux_arm64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("README-${pkgver}.md::${_ghurlraw}/README.en.md")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[0]}.tar.gz")
source_aarch64=("${_appname}-${arch[1]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}_${_barch[1]}.tar.gz")
sha256sums=('492f63c7c78dcc7d9ff97e850fb6a57b034f8c99886a9238ecbdf37ae696bcbe')
sha256sums_x86_64=('1bcd10f82f924562f32262be2e93f47e6769a399a857a51e334124038ea38929')
sha256sums_aarch64=('fcc11009380f5faaac4b4e610a17e57f07d7d27f8ae6c86e9774d603d33c1cf2')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
