# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ayanchavand
_pkgname=FiTui
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal-based personal finance tracker"

pkgver=0.1.4
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_pkgname}")
depends=('glibc' 'libgcc')

source=("README-${_pkgvername}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${_pkgvername}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('4e6bf406935b39c018e40d354514286ee89abe1e096ea0ad4955a2ab16ce78ea')
sha256sums_x86_64=('261f0726e457b229d67f242c5e5176fc49247b5c8e7a0eabae9650654323f762')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${_pkgvername}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
