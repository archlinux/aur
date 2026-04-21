# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=iRootPro
_gitname=rdr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="Terminal RSS/Atom feed reader built with Go"

pkgver=0.7.0
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
sha256sums=('b5bad4801a23db1724a2371361def5f8430292dd612b1c102776cfa49a044178')
sha256sums_x86_64=('dac4ac158bbfc5797d3d253436caaa0a85d9620dc5e3dc83e0f45b4e6475ca6b')
sha256sums_aarch64=('234e658e8fefa1ece32385c140c1b9d99b869918a1e7c3606a56a16f8c7b859b')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
