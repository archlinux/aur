# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_gitauthor=programmersd21
_gitname=wallr
_appname=${_gitname}
pkgname=${_appname}-bin
pkgdesc="🎨 GPU-accelerated animated wallpaper engine for Wayland"

pkgver=0.1.0
pkgrel=1
_gitversion=v${pkgver}

arch=('x86_64')
_barch=('linux-amd64')

_ghurl="https://github.com/${_gitauthor}/${_gitname}"
_ghurlraw="https://raw.githubusercontent.com/${_gitauthor}/${_gitname}/${_gitversion}"
url=${_ghurl}

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")

options=(!strip)

source=("LICENSE-${pkgver}::${_ghurlraw}/LICENSE")
source_x86_64=("${_appname}-${arch[0]}-${pkgver}.tgz::${_ghurl}/releases/download/${_gitversion}/${_appname}-${_barch[0]}.tar.gz")
sha256sums=('cc3c6e9b47b26034c07cf061c660c58cf11a522d8d26eed42b68d8ece1c5076e')
sha256sums_x86_64=('06c4fa6310e7853c6d38f819ec0c2af54e885b6aef6d90b20b8758179fc64124')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	install -dm7555 "${pkgdir}/usr/share/doc/${pkgname}/docs/"
	cp -rf "docs/"* "${pkgdir}/usr/share/doc/${pkgname}/docs/"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
