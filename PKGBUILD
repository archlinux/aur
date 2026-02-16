# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=ayanchavand
_pkgname=FiTui
_appname=${_pkgname,,}
pkgname=${_appname}-bin
pkgdesc="Terminal-based personal finance tracker"

pkgver=0.1.5
pkgrel=1
_pkgvername=v${pkgver}

arch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('MIT')

provides=("${_appname}")
conflicts=("${_appname}")
depends=('glibc' 'libgcc')

source=("README-${_pkgvername}.md::${_urlraw}/README.md")
source_x86_64=("${_pkgname}-${_pkgvername}::${url}/releases/download/${_pkgvername}/${_appname}")
sha256sums=('e3d855f7c75ae91c2029edc9f787a75d5dab9cc870f2dbab25fa5d9e0adfe6ff')
sha256sums_x86_64=('5125089324c19d3683c7920926fe5f300a486d4bc06ea221767920f5e9fdc7ff')


package() {
	cd "${srcdir}/" || exit

	install -Dm755 "${_pkgname}-${_pkgvername}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README-${_pkgvername}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
